import 'package:flutter/material.dart';

class MoneySenderPage extends StatefulWidget {
  const MoneySenderPage({super.key});

  @override
  State<MoneySenderPage> createState() => _MoneySenderPageState();
}

class _MoneySenderPageState extends State<MoneySenderPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        Colors.black45,
        Colors.black,
        Colors.black,
        Colors.black,
        Colors.orange[900]!,
        Colors.amber[200]!,
        Colors.amber[200]!,
        Colors.amber[200]!,
        Colors.white
      ], radius: 1.5)),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              headerParts(),
              SizedBox(height: size.height * 0.05),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Image.asset(
                      "images/pexels.jpg",
                      fit: BoxFit.cover,
                      height: 45,
                      alignment: Alignment.center,
                    )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rendosland Agyapong",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "iksr asj sdil ikear",
                          style: TextStyle(color: Colors.white24, fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  '\$260.00',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 75,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                  color: Colors.white,
                  thickness: 0.1,
                  indent: 10.0,
                  endIndent: 60),
              const Row(
                children: [
                  Text(
                    "AC Balance",
                    style: TextStyle(color: Colors.white24),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "\$1256.878",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    ));
  }

  Row headerParts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.white))),
        const Text("Send Money",
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
              child: Badge(child: Icon(Icons.credit_card)),
            ),
          ),
        )
      ],
    );
  }
}
