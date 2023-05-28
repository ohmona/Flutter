import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  bool showText = true;

  void onClick() {
    setState(() {
      count += 1;
    });
  }

  void toggle() {
    setState(() {
      showText = !showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w800,
            color: Color(0xFF000000),
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFC9AE8C),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showText ? LargeText(text: "Click to count up") : Text("Hmm mm..."),
              LargeText(text: "$count"),
              IconButton(
                onPressed: onClick,
                icon: Icon(Icons.add_box_outlined),
              ),
              TextButton(
                onPressed: toggle,
                child: Text("Toggle"),
              ),
              MaterialButton(
                onPressed: onClick,
                child: Text('Material Button'),
              ),
              ElevatedButton(
                onPressed: onClick,
                child: Text("Elevated Button"),
              ),
              OutlinedButton(
                onPressed: onClick,
                child: Text("Outlined Button"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LargeText extends StatefulWidget {
  const LargeText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<LargeText> createState() => _LargeTextState();
}

class _LargeTextState extends State<LargeText> {

  @override
  void initState() {
    super.initState();
    print("InitState!");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("Build!");
    return Text(
      widget.text,
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
        fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight,
      ),
    );
  }
}
