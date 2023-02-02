import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../note.dart';

class ViewPrescription extends StatelessWidget {
  final int index;
  final Note notes;
  const ViewPrescription({
    Key? key,
    required this.notes,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text(
                          "Record #${index + 1}",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.chevron_back),
                        iconSize: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        FontAwesomeIcons.clock,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        notes.fee,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        FontAwesomeIcons.userDoctor,
                        size: 15,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        // height: 30,
                        child: Text(
                          notes.location,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.noteSticky,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            'Notes',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        notes.notes,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.scaleBalanced,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            'Vitals',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        notes.vitals,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.tablets,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            'Medicines',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        notes.medicines,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            FontAwesomeIcons.message,
                            color: Colors.black,
                            size: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Text(
                            'Advice',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        notes.advice,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ]),
          ),
        )));
  }
}
