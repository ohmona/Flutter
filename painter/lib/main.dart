import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(DrawingApp());

class DrawingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawingPage(),
    );
  }
}

class DrawingPage extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  List<List<Offset>> strokes = [];
  List<Offset> currentStroke = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing App'),
      ),
      body: GestureDetector(
        onPanStart: (details) {
          if (details.kind != PointerDeviceKind.stylus) return;
          setState(() {
            currentStroke = [details.localPosition];
            strokes.add(currentStroke);
          });
        },
        onPanUpdate: (details) {
          if (!_isStylusEvent(details)) return;
          setState(() {
            currentStroke.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            currentStroke = [];
          });
        },
        child: Stack(
          children: [
            CustomPaint(
              painter: DrawingPainter(strokes),
              size: Size.infinite,
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: Text(
                'Position: ${currentStroke.isNotEmpty ? currentStroke.last.toString() : ''}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: ElevatedButton(
                onPressed: () {
                  clearLastStroke();
                },
                child: Text('Clear Last Stroke'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.clear),
        onPressed: () {
          setState(() {
            strokes.clear();
          });
        },
      ),
    );
  }

  bool _isStylusEvent(DragUpdateDetails details) {
    // 소스 타임스탬프를 통해 펜 입력 여부 확인
    return details.sourceTimeStamp?.inMicroseconds != 0;
  }

  void clearLastStroke() {
    if (strokes.isNotEmpty) {
      setState(() {
        strokes.removeLast();
      });
    }
  }
}

class DrawingPainter extends CustomPainter {
  final List<List<Offset>> strokes;

  DrawingPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final path = Path();
      path.addPolygon(stroke, false);

      final paint = Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4.0;

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
