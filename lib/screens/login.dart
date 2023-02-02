import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/home_screen.dart';
import 'package:notes_app/screens/patient_home_page.dart';

import '../global.dart';
import 'doctor_home_page.dart';

bool adding = false;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController address = TextEditingController();
  TextEditingController privateKey = TextEditingController();
  TextEditingController role = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  _showPicker() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.0))),
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Text(
                    "Roles",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    leading: const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Patient',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      role.text = "Patient";
                      setState(() {});
                      Navigator.pop(context);
                    }),
                ListTile(
                    leading: const Icon(
                      FontAwesomeIcons.userDoctor,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Doctor',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      role.text = "Doctor";
                      setState(() {});
                      Navigator.pop(context);
                    })
              ],
            ),
          );
        });
  }

  void moveToHome() async {
    bool result;
    if (_formKey.currentState!.validate()) {
      adding = true;
      setState(() {});
      if (role.text == "Patient") {
        setState(() {
          privateKey.text =
              "03a6cd230f000754daf6a2cef9b3bd1d726be32a0c482dc23544c8f4eb245c2c";
          globalPrivateKey =
              "03a6cd230f000754daf6a2cef9b3bd1d726be32a0c482dc23544c8f4eb245c2c";
        });
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientScreen(),
            ));
        adding = false;
      } else if (role.text == "Doctor") {
        setState(() {
          privateKey.text =
              "64264902a53ce002c6573014eba612d1eb56992e8fa2f07cb40f3213696186bd";
          globalPrivateKey =
              "64264902a53ce002c6573014eba612d1eb56992e8fa2f07cb40f3213696186bd";
        });
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorsScreen(),
            ));
        adding = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).canvasColor,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100)),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          child: Image.asset(
                            "assets/images/welcomeImage.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text(
                      "Sign-In",
                      style: GoogleFonts.lato(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
                    child: CupertinoFormSection(
                      backgroundColor: Colors.transparent,
                      children: [
                        CupertinoFormRow(
                          //padding: EdgeInsets.only(left: 0),
                          child: CupertinoTextFormFieldRow(
                            style: GoogleFonts.poppins(),
                            controller: privateKey,
                            placeholder: "Enter your private key",
                            enabled: false,
                            prefix: Text(
                              "Key      ",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            padding: const EdgeInsets.only(left: 0),
                            keyboardType: TextInputType.emailAddress,
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return "Key can't be empty";
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        CupertinoTextFormFieldRow(
                          style: GoogleFonts.poppins(),
                          controller: role,
                          onTap: _showPicker,
                          placeholder: "Tap to Show Roles",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Role can't be empty";
                            }
                            return null;
                          },
                          decoration: const BoxDecoration(color: Colors.white),
                          prefix: Text(
                            "Role            ",
                            style: Theme.of(context).textTheme.caption,
                          ),
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: adding
                        ? const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 40),
                              child: CupertinoActivityIndicator(
                                radius: 20,
                              ),
                            ),
                          )
                        : Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () => moveToHome(),
                                icon: const Icon(Icons.send_outlined),
                                iconSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
