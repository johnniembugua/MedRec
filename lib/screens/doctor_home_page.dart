// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/global.dart';
import 'package:notes_app/notes_services.dart';
import 'package:notes_app/screens/view_prescription.dart';

import 'add_record.dart';

class DoctorsScreen extends ConsumerStatefulWidget {
  const DoctorsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends ConsumerState<DoctorsScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController feeController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    feeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var notesServices = ref.watch(notesServiceProvider);

    return Scaffold(
      body: notesServices.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {},
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(50),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            CupertinoIcons.person_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                          VerticalDivider(
                            color: Colors.white,
                            // thickness: 5,
                          ),
                          Center(
                            child: Text(
                              'Doctors Panel',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Connection $globalPrivateKey",
                                style: TextStyle(
                                    fontSize:
                                        (MediaQuery.of(context).size.width *
                                            0.02),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginPage()),
                              //     (route) => false);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      fontSize:
                                          (MediaQuery.of(context).size.width *
                                              0.02),
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              FontAwesomeIcons.timeline,
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
                              'Medical History',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    notesServices.notes.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(top: 32.0, left: 16),
                            child: Text(
                              "No Medical History!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: notesServices.notes.length,
                            itemBuilder: (context, index) {
                              final notes = notesServices.notes[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Container(
                                    // margin: EdgeInsets.all(16),
                                    // height: 100,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewPrescription(
                                                      notes: notes,
                                                      index: index,
                                                    )));
                                      },
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Container(
                                                color: Colors.black,
                                                child: Text(
                                                  "  ${index + 1}  ",
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // const VerticalDivider(
                                          //   thickness: 2,
                                          // ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                    FontAwesomeIcons.clock,
                                                    size: 15,
                                                    // color: Colors.grey,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    notes.fee,
                                                    // style:
                                                    //     Theme.of(context).textTheme.caption,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            150,
                                                    // height: 30,
                                                    child: Text(
                                                      notes.location,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                              onTap: () {
                                                print("Pressed");
                                                notesServices.deleteNote(
                                                    notesServices
                                                        .notes[index].id);
                                              },
                                              child: Icon(Icons.delete)),
                                          // IconButton(
                                          //   icon: const Icon(
                                          //     Icons.delete,
                                          //     color: Colors.red,
                                          //   ),
                                          //   onPressed: () {

                                          //   },
                                          // ),
                                        ],
                                      ),
                                    )),
                              );

                              // ListTile(
                              //   title: Text(notesServices.notes[index].fee),
                              //   subtitle:
                              //       Text(notesServices.notes[index].location),
                              //   trailing: IconButton(
                              //     icon: const Icon(
                              //       Icons.delete,
                              //       color: Colors.red,
                              //     ),
                              //     onPressed: () {
                              //       notesServices.deleteNote(
                              //           notesServices.notes[index].id);
                              //     },
                              //   ),
                              // );
                            },
                          ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddRecordPage()));
        },
      ),
    );
  }
}
