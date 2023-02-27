import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List item = ["Compact", "Compact Pro", "Premium", "Premium Plus"];
    List price = ["1599", "3599", "5599", "6599"];
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: SafeArea(
          child: Column(
        children: [
          const Text("Get quickly"),
          Card(
            child: Column(
              children: [
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Cardmodel(quility: item[index], price: price[index]);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("+18% GST"),
                    Text("T & C apply"),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}

class Cardmodel extends StatefulWidget {
  String quility;
  String price;
  Cardmodel({required this.quility, required this.price, super.key});

  @override
  State<Cardmodel> createState() => _CardmodelState();
}

class _CardmodelState extends State<Cardmodel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(widget.quility),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\u{20B9}${widget.price}'),
            Radio(
                value: widget.price,
                groupValue: widget.price,
                onChanged: ((value) {
                  setState(() {
                    widget.price == value;
                  });
                }))
          ],
        )
      ],
    );
  }
}

class BenifitModel extends StatefulWidget {
  String radiovalue;
  String benifits;
  BenifitModel({required this.radiovalue, required this.benifits, super.key});

  @override
  State<BenifitModel> createState() => _BenifitModelState();
}

class _BenifitModelState extends State<BenifitModel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            value: widget.radiovalue,
            groupValue: widget.radiovalue,
            onChanged: (value) {
              setState(() {
                widget.radiovalue == value;
              });
            }),
        SizedBox(
          width: 5,
        ),
        Text(
          widget.benifits,
          maxLines: 2,
          overflow: TextOverflow.clip,
        )
      ],
    );
  }
}
