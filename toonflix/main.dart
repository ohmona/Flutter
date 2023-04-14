import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class Player {
  String name;
  Player({required this.name});
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         backgroundColor: Color(0xFF181818),
         body: Padding(
           padding: EdgeInsets.symmetric(horizontal: 10),
           child: Column(
             children: [
               SizedBox(
                 height: 20,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text('Hey, Selena',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 25,
                           fontWeight: FontWeight.w800,
                         ),
                       ),
                       Text('Welcome back',
                         style: TextStyle(
                           color: Colors.white.withOpacity(0.8),
                           fontSize: 12,
                         ),
                       ),
                     ],
                   )
                 ],
               )
             ],
           ),
         )
       ),
     );
  }
}
