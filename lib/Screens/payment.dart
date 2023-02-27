import 'package:flutter/material.dart';
import 'package:task/Screens/finalpayment.dart';

class PaymentScreen extends StatefulWidget {
  String amount;
  PaymentScreen({required this.amount, super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final gstamount = int.parse(widget.amount.toString()) * 18 / 100;
    final payableamount = int.parse(widget.amount.toString()) + gstamount;
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined))),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Price Details",
                style: TextStyle(fontSize: 17),
              ),
              const Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Amount",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '\u{20B9} ${int.parse(widget.amount.toString()).toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "GST",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '\u{20B9} ${gstamount.toString()}',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              const Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Amount Payable",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '\u{20B9} $payableamount',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              const Divider(
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      hoverColor: Colors.green,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FinalPaymentScreen()));
                      },
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Make payment",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '\u{20B9} $payableamount',
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
