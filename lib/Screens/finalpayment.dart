import 'package:flutter/material.dart';

class FinalPaymentScreen extends StatelessWidget {
  String amount;
  FinalPaymentScreen({required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: Colors.black,
              ))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Google.png",
                    height: 50,
                    width: 50,
                  ),
                  const Text(
                    "Pay",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.black54,
                  ),
                ),
                Text(
                  " OR ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Card Information",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.credit_card),
                        border: OutlineInputBorder(),
                        hintText: "Card Number"),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: "MM/YY"),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.credit_card),
                          border: OutlineInputBorder(),
                          hintText: "CVC"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Pay",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "\u{20B9}${amount}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
