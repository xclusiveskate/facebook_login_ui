import 'package:facebook_mobile_ui/reset_pass.dart';
import 'package:facebook_mobile_ui/sign_up.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  _LogInState() {
    // moreLanguage = languages.last;
  }
  final formKey = GlobalKey<FormState>();
  FocusScopeNode node = FocusScopeNode();
  @override
  void dispose() {
    node.dispose();

    super.dispose();
  }

  List languages = [
    'English(US)',
    'Hausa',
    'Francais',
    'Portugues',
    'Espanol',
    'العربية',
    'Bahasa',
    'Deutsch',
    '本語',
    'Italiano',
  ];

  // var moreLanguage;
  // bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          color: const Color.fromARGB(255, 241, 238, 238),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const Text(
                  "facebook",
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 132, 233),
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: "San serif"),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: MediaQuery.of(context).size.height / 1.45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Log in to Facebook",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                      Form(
                          key: formKey,
                          child: FocusScope(
                              node: node,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value!.isNotEmpty &&
                                            value.contains('@')) {
                                          return null;
                                        } else {
                                          return 'Invalid email';
                                        }
                                      },
                                      onEditingComplete: () {
                                        node.nextFocus();
                                      },
                                      decoration: InputDecoration(
                                          hintText:
                                              "Email address or phone number",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.blue,
                                                width: 5,
                                              ))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      // keyboardAppearance: Brightness.dark,
                                      textInputAction: TextInputAction.done,
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
                                      onEditingComplete: () {
                                        node.unfocus();
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.blue,
                                                width: 5,
                                              ))),
                                    ),
                                  ),
                                ],
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(MediaQuery.of(context).size.width, 50))),
                          onPressed: () {
                            setState(() {
                              formKey.currentState!.validate();
                            });
                          },
                          child: const Text("Log in",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Reset())));
                        },
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 180,
                            child: Divider(
                              height: 5,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.grey,
                            ),
                          ),
                          Text("or"),
                          SizedBox(
                            width: 180,
                            child: Divider(
                              height: 10,
                              indent: 15,
                              endIndent: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 51, 200, 56)),
                              minimumSize: MaterialStateProperty.all(Size(
                                  MediaQuery.of(context).size.width / 1.4,
                                  70))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const SignUp())));
                          },
                          child: const Text("Create New Account",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // color: Colors.white,
                  height: MediaQuery.of(context).size.height / 10,
                  child: Wrap(
                      // runAlignment: WrapAlignment.spaceBetween,
                      children: languages
                          .map((e) =>
                              TextButton(onPressed: () {}, child: Text(e)))
                          .toList()),
                ),
                const Divider(
                  color: Colors.black,
                ),
                SizedBox(
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
