import 'package:flutter/material.dart';
import 'package:task/Screens/payment.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int radioValue = 1;

  void _handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }

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

  List compact = [1, 2, 3];
  List compactpro = [1, 3, 5, 6, 7];
  List premium = [1, 2, 3, 4, 5];
  List premiumplus = [1, 2, 3, 4, 5, 8, 9];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: SafeArea(
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
                        itemCount: item.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _handleRadioValueChanged(index);
                              });
                            },
                            child: Card(
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
                                        item[index],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\u{20B9} ${price[index]}',
                                            style:
                                                const TextStyle(fontSize: 17),
                                          ),
                                          Radio<int>(
                                              value: index,
                                              groupValue: radioValue,
                                              onChanged: ((value) {
                                                _handleRadioValueChanged(
                                                    value!);
                                              }))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      childAspectRatio: 2.5),
                  itemCount: benifits.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                              border: Border(right: BorderSide()),
                            ),
                            child: Text(
                              "$index ",
                              style: const TextStyle(fontSize: 15),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        (radioValue == 0
                                    ? compact
                                    : radioValue == 1
                                        ? compactpro
                                        : radioValue == 2
                                            ? premium
                                            : premiumplus)
                                .contains(index)
                            ? const Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Text(
                            benifits[index],
                            overflow: TextOverflow.fade,
                            style: const TextStyle(fontSize: 17),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                hoverColor: Colors.green,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                                amount: price[radioValue],
                              )));
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Subscribe for ${item[radioValue]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )),
      ),
    );
  }
}

// class BenifitModel extends StatefulWidget {
//   String radiovalue;
//   String benifits;
//   String index;
//   List istrue;
//   BenifitModel(
//       {required this.radiovalue,
//       required this.benifits,
//       required this.index,
//       required this.istrue,
//       super.key});

//   @override
//   State<BenifitModel> createState() => _BenifitModelState();
// }

// class _BenifitModelState extends State<BenifitModel> {
//   late List istruedata = widget.istrue;

//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }
