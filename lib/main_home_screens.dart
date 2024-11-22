// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bankingapp/card_details_screen.dart';
import 'package:bankingapp/model.dart';
import 'package:bankingapp/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black45,
          Colors.black,
          Colors.black,
          Colors.black,
          Colors.orange[600]!,
          Colors.amber[200]!,
          Colors.amber[200]!,
          Colors.amber[200]!,
          Colors.white
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerParts(),
                    SizedBox(height: size.height * 0.05),
                    const Text('Your Current Balance',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const Text(
                      '\$1847.56',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: cards.map(buildCard).toList(),
                        )),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transition History",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text("See all",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: transactions.map(transactionHistory).toList(),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget transactionHistory(Transaction transaction) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transaction.title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: transaction.isDebit ? Colors.white : Colors.black)),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(transaction.description,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            transaction.isDebit ? Colors.white : Colors.black)),
                Text(transaction.amount,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:
                            transaction.isDebit ? Colors.white : Colors.black)),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget buildCard(cardModel card) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => CardDetailScreen(card: card)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 4,
                left: 2,
              ),
              child: Container(
                height: 270,
                width: 200,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white70,
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(-1, 1),
                      ),
                    ],
                    border: Border.all(color: Colors.white12),
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 120, top: 22),
                          child: Image.asset(card.method, height: 40)),
                      Image.asset(card.cardImage, height: 50),
                      SizedBox(height: 20),
                      Text(card.cardType.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("${card.cardHoldername} ${card.expiryDate}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 90,
                          right: 15,
                        ),
                        child: Image.asset(card.cardLogo, height: 60),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row headerParts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: Icon(Icons.grid_view_rounded, color: Colors.white)),
        const Text("Home",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(50)),
            child: const Center(
              child: Badge(
                  child: Icon(
                Iconsax.notification,
                color: Colors.white,
              )),
            ),
          ),
        )
      ],
    );
  }
}
