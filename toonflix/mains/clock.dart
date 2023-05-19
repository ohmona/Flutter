import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              InfoCard(
                text: "20:18",
                size: 300,
                max: true,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  InfoCard(
                    text: "19.05.23",
                    size: 80,
                    max: false,
                    fontWeight: FontWeight.w500,
                  ),
                  InfoWithIcon(
                    text: "14'C",
                    size: 80,
                    max: false,
                    fontWeight: FontWeight.w500,
                    icon: Icons.cloud,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard(
      {Key? key,
      required this.text,
      required this.size,
      required this.max,
      required this.fontWeight})
      : super(key: key);

  final String text;
  final double size;
  final bool max;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: max ? 10000 : size * 5,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

class InfoWithIcon extends StatelessWidget {
  const InfoWithIcon({
    Key? key,
    required this.text,
    required this.size,
    required this.max,
    required this.fontWeight,
    required this.icon,
  }) : super(key: key);

  final String text;
  final double size;
  final bool max;
  final FontWeight fontWeight;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: max ? 10000 : size * 5,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Transform.scale(
              scale: 2.1,
              child: Transform.translate(
                offset: Offset(-15, 5),
                child: Icon(
                  icon,
                  size: size,
                ),
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size,
                fontWeight: fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
