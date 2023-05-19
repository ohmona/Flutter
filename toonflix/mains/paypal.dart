import 'package:flutter/material.dart';
import 'package:toonflix/widgets/currency_card.dart';
import 'package:toonflix/widgets/button.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Hey, Selena',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 85,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '\$5 102 934',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Button(
                          text: 'Transfer',
                          bgColor: Color(0xFFF1B33B),
                          textColor: Colors.black,
                        ),
                        Button(
                          text: 'Request',
                          bgColor: Color(0xFF1F2123),
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 429',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  index: 1,
                ),
                CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '6 972',
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: true,
                  index: 2,
                ),
                CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '39 203',
                  icon: Icons.attach_money,
                  isInverted: false,
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}