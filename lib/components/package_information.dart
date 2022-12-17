import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wpms/models/package.dart';

class PackageInformation extends StatelessWidget {
  final PackageData packageData;
  const PackageInformation({super.key, required this.packageData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 8),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.indigo.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade400,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        (constraints.constrainWidth() / 6)
                                            .floor(),
                                        (index) => SizedBox(
                                              height: 1,
                                              width: 3,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color:
                                                        Colors.grey.shade300),
                                              ),
                                            )),
                                  );
                                },
                              ),
                            ),
                            Center(
                                child: Transform.rotate(
                              angle: 0,
                              child: Icon(
                                Icons.local_shipping_rounded,
                                color: Colors.indigo.shade300,
                                size: 25,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                        height: 8,
                        width: 8,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.pink.shade400,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        width: 100,
                        child: Text(
                          packageData.getLocatedAt,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        )),
                    SizedBox(
                        width: 100,
                        child: Text(
                          packageData.getFDD,
                          textAlign: TextAlign.end,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              (constraints.constrainWidth() / 10).floor(),
                              (index) => SizedBox(
                                    height: 1,
                                    width: 5,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400),
                                    ),
                                  )),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        const Text(
                          "- Arrival Date -",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          packageData.getArrivalDate,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "- Package Status -",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          packageData.getStatus,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),

                    /*Row(
                      children: const <Widget>[
                        Text(
                          "Flight No : ",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "23",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),*/
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          Material(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), bottomRight: Radius.circular(24)),
            elevation: 3,
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 139, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
              child: Text("Package ID - ${packageData.getPackageID}",
                  style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
              elevation: 3,
              child: GestureDetector(
                child: Container(
                  width: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 139, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24)),
                  ),
                  child: Text("Pay \$${packageData.getCost}",
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ),
                onTap: () {
                  openDialog(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('Pay Now!'),
              content: const Text('Pay this Shipment'),
              actions: [
                TextButton(
                  child: const Text('Pay',
                      style: TextStyle(color: Color.fromRGBO(0, 0, 139, 1))),
                  onPressed: () async {
                    String docId = "";
                    await FirebaseFirestore.instance
                        .collection('Payments')
                        .where('PackageID', isEqualTo: packageData.getPackageID)
                        .get()
                        .then((value) {
                      docId = value.docs.first.id;
                    });

                    await FirebaseFirestore.instance
                        .collection('Payments')
                        .doc(docId)
                        .update({'Status': "Completed"});
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )),
      );
}
