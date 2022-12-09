import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  _SignUpState() {
    countryValue = countries.first;
  }
  final dobController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FocusScopeNode focus = FocusScopeNode();
  @override
  void dispose() {
    dobController.dispose();
    focus.dispose();
    super.dispose();
  }

  String? countryValue;
  List countries = [
    "Australia",
    "Belgium",
    "Canada",
    "Denmark",
    "England",
    "Finland",
    "Germany",
    "Holland",
    "Iran",
    "Japan",
    "Korea",
    "Norway",
    "Nigeria"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 243, 243),
        body: Container(
          // alignment: Alignment.center,
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "facebook",
                      style: TextStyle(
                          color: Color.fromARGB(255, 12, 121, 209),
                          fontSize: 66,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Create a new account",
                          style: TextStyle(fontSize: 30),
                        ),
                        const Text(
                          "It's quick and easy",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blueGrey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Form(
                              key: formKey,
                              child: FocusScope(
                                node: focus,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              focus.nextFocus();
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                return null;
                                              } else {
                                                return "First name required";
                                              }
                                            },
                                            decoration: InputDecoration(
                                                hintText: "First Name",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              focus.nextFocus();
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                return null;
                                              } else {
                                                return "Surname required";
                                              }
                                            },
                                            decoration: InputDecoration(
                                                hintText: "Surname",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        onEditingComplete: () {
                                          focus.nextFocus();
                                        },
                                        textInputAction: TextInputAction.next,
                                        showCursor: true,
                                        validator: (value) {
                                          if (value!.isNotEmpty &&
                                              value.contains('@')) {
                                            return null;
                                          } else {
                                            return 'Invalid email';
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText:
                                                "Mobile number or email address",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        onEditingComplete: () {
                                          focus.nextFocus();
                                        },
                                        textInputAction: TextInputAction.next,
                                        showCursor: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'password field required';
                                          } else {
                                            if (value.length >= 6) {
                                              return null;
                                            } else {
                                              return 'Invalid password';
                                            }
                                          }
                                        },
                                        decoration: InputDecoration(
                                            hintText: "New Password",
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            onEditingComplete: () {
                                              focus.nextFocus();
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            validator: (value) {
                                              if (value!.isNotEmpty) {
                                                return null;
                                              } else {
                                                return "DOB required";
                                              }
                                            },
                                            controller: dobController,
                                            decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                    onPressed: () async {
                                                      DateTime? datePicked =
                                                          await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime(
                                                                      2000),
                                                              firstDate:
                                                                  DateTime(
                                                                      1905),
                                                              lastDate:
                                                                  DateTime(
                                                                      2022));

                                                      if (datePicked != null) {
                                                        dobController
                                                            .text = DateFormat(
                                                                'dd/ MM / yyyy')
                                                            .format(datePicked)
                                                            .toString();
                                                      }
                                                    },
                                                    icon: const Icon(
                                                        Icons.arrow_drop_down)),
                                                hintText: "dd/MM/yyyy",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5))),
                                          ),
                                        )),
                                        Expanded(
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: DropdownButtonFormField(
                                                  validator: (value) {
                                                    if (value
                                                        .toString()
                                                        .isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return "Nationality required";
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                      hintText: "Nationality",
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5))),
                                                  isExpanded: false,
                                                  // value: ,
                                                  onChanged: (value) {
                                                    if (value
                                                        .toString()
                                                        .isNotEmpty) {
                                                      value = countryValue
                                                          .toString();
                                                    } else {}
                                                  },
                                                  items: countries
                                                      .map((e) =>
                                                          DropdownMenuItem(
                                                              value: e,
                                                              child: Text(e)))
                                                      .toList(),
                                                ))),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: const Border.symmetric(
                                                    vertical: BorderSide(
                                                        color: Colors.blue),
                                                    horizontal: BorderSide(
                                                        color: Colors.blue))),
                                            child: RadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    const EdgeInsets.all(2),
                                                title: const Text("Male"),
                                                value: "Male",
                                                groupValue: genderValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderValue =
                                                        value.toString();
                                                  });
                                                }),
                                          )),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: const Border
                                                          .symmetric(
                                                      vertical: BorderSide(
                                                          color: Colors.blue),
                                                      horizontal: BorderSide(
                                                          color: Colors.blue))),
                                              child: RadioListTile(
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .trailing,
                                                  contentPadding:
                                                      const EdgeInsets.all(1),
                                                  title: const Text("Female"),
                                                  value: "Female",
                                                  groupValue: genderValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      genderValue =
                                                          value.toString();
                                                    });
                                                  }),
                                            ),
                                          )),
                                          Expanded(
                                              child: Container(
                                            height: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: const Border.symmetric(
                                                    vertical: BorderSide(
                                                        color: Colors.blue),
                                                    horizontal: BorderSide(
                                                        color: Colors.blue))),
                                            child: RadioListTile(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                contentPadding:
                                                    const EdgeInsets.all(2),
                                                title: const Text("Custom"),
                                                value: "Custom",
                                                groupValue: genderValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderValue =
                                                        value.toString();
                                                  });
                                                }),
                                          ))
                                        ],
                                      ),
                                    ),
                                    const Text(
                                        "People who use our service may have uploaded your contact information to Facebook. Learn more."),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "By clicking Sign Up, you agree to our Terms, Privacy Policy and Cookies Policy.",
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    const Text(
                                        "You may receive SMS notifications from us and can opt out any time.... ",
                                        style: TextStyle(fontSize: 12)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green),
                                              minimumSize:
                                                  MaterialStateProperty.all(
                                                      Size(
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                          50))),
                                          onPressed: () {
                                            formKey.currentState!.validate();
                                          },
                                          child: const Text("Sign Up")),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                            "Already have an account??"))
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  String genderValue = "Male";
}
