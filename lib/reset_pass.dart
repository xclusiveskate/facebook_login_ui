import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 70,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 227, 225, 225),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      blurStyle: BlurStyle.inner)
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "facebook",
                        style: TextStyle(
                            color: Color.fromARGB(255, 7, 126, 224),
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16),
                              backgroundColor:
                                  const Color.fromARGB(255, 7, 126, 224)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          "Find Your Account",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        child: Divider(
                          height: 10,
                          color: Colors.black,
                          indent: 1.0,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Please enter your email address or mobile number to search for your account",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter you email to have access to your account";
                                } else {
                                  if (value.isNotEmpty && value.contains('@')) {
                                    return null;
                                  } else {
                                    return 'invalid email';
                                  }
                                }
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                  hintText: "Email address or mobile number",
                                  border: OutlineInputBorder(
                                      gapPadding: 2.0,
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        child: Divider(
                          height: 20,
                          color: Colors.black,
                          indent: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 222, 222, 222)),
                                      minimumSize: MaterialStateProperty.all(
                                          Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.7,
                                              45))),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                      minimumSize: MaterialStateProperty.all(
                                          Size(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.7,
                                              45))),
                                  onPressed: () {
                                    formKey.currentState!.validate();
                                  },
                                  child: const Text(
                                    "Search",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 60,
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Wrap(
                  children: others
                      .map((e) => TextButton(
                          onPressed: () {},
                          child: Text(
                            e,
                            style: const TextStyle(color: Colors.grey),
                          )))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List others = [
    'Sign Up',
    'Log in',
    'Messenger',
    'FacebookLite',
    'Watch',
    'places',
    'Games',
    'MarketPlace',
    'Meta Pay',
    'Oculus',
    'Portal',
    'Instagram',
    'Bulletin',
    'Fundraisers',
    'Services',
    'Voting Information Centre',
    'Privacy Policy',
    'Privacy Centre',
    'Groups',
    'About',
    'Create ad',
    'Create Page',
  ];
}
