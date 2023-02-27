import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = const TextStyle(fontSize: 18);
    List item = ["Compact", "Compact Pro", "Premium", "Premium Plus"];
    List price = ["1599", "3599", "5599", "6599"];
    List benifits = [
      "4 days validity",
      "Instagram marketing of your property",
      "Top slot researved for better search",
      "Rental agreement delivered to your home",
      "Privacy of your contact number",
      "Field assistant",
      "Profestional photos of your property",
      "Rentl represantataion on your behalf",
      "Relationship manager"
    ];
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "• Get quickly",
                style: style,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(color: Colors.grey, width: 0.5)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.8),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Cardmodel(
                            quility: item[index], price: price[index]);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("+18% GST"),
                          Text("T & C apply"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "• Benifit Provided",
                style: style,
              ),
            ),
            const Divider(),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 3.5),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return BenifitModel(
                  radiovalue: price[index],
                  benifits: item[index],
                  index: index.toString(),
                  istrue: false,
                );
              },
            ),
          ],
        ),
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
    return Card(
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.quility,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\u{20B9} ${widget.price}',
                    style: const TextStyle(fontSize: 17),
                  ),
                  Radio(
                      value: widget.price,
                      groupValue: widget.price,
                      onChanged: ((value) {
                        setState(() {
                          widget.price == value;
                        });
                      }))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BenifitModel extends StatefulWidget {
  String radiovalue;
  String benifits;
  String index;
  bool istrue;
  BenifitModel(
      {required this.radiovalue,
      required this.benifits,
      required this.index,
      required this.istrue,
      super.key});

  @override
  State<BenifitModel> createState() => _BenifitModelState();
}

class _BenifitModelState extends State<BenifitModel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: const BoxDecoration(
              border: Border(right: BorderSide()),
            ),
            child: Text(
              "${widget.index} ",
              style: const TextStyle(fontSize: 15),
            )),
        const SizedBox(
          width: 5,
        ),
        widget.istrue
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Icon(
                Icons.check,
                color: Colors.white,
              ),
        const SizedBox(
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
