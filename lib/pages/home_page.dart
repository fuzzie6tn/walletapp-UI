import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletappui/pages/my_button.dart';
import 'package:walletappui/pages/my_list_tile.dart';
import 'package:walletappui/util/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          //app bar
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        'My ',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cards',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),

                  //plus button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //cards
            Container(
              height: 200,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  MyCard(
                    balance: 1000.0,
                    cardNumber: 32334445,
                    expiryMonth: 12,
                    expiryYear: 2030,
                    color: Colors.deepPurple[400],
                  ),
                  MyCard(
                    balance: 100000.0,
                    cardNumber: 198767,
                    expiryMonth: 10,
                    expiryYear: 2023,
                    color: Colors.blue[400],
                  ),
                  MyCard(
                    balance: 5000.0,
                    cardNumber: 5688444,
                    expiryMonth: 01,
                    expiryYear: 2024,
                    color: Colors.orange[900],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),
            //page indicator

            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              //tells which type pf indicator effect you want
              effect: ExpandingDotsEffect(
                //color
                activeDotColor: Colors.grey.shade500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //three buttons => send + pay +bils
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //send button
                  MyButton(
                    iconImagePath: 'lib/icons/send-money.png',
                    buttonText: 'Send',
                  ),
                  //pay button
                  MyButton(
                    iconImagePath: 'lib/icons/creditcard.png',
                    buttonText: 'Pay',
                  ),

                  //bills button
                  MyButton(
                    iconImagePath: 'lib/icons/bill.png',
                    buttonText: 'Bills',
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            //column -> stats + transaction
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: [
                  //stats
                  MyListTile(
                    iconImagePath: 'lib/icons/statistics.png',
                    tileSubtitle: 'Payments and Incomes',
                    tileTitle: 'Statistics',
                  ),

                  //transaction
                  MyListTile(
                    iconImagePath: 'lib/icons/transaction.png',
                    tileSubtitle: 'Transaction history',
                    tileTitle: 'Transactions',
                  ),
                ],

                //trancsaction
              ),
            )
          ],

          //columns => stats, transation
        ),
      ),
    );
  }
}
