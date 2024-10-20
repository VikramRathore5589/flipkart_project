import 'package:flipkart_project/all_screens/log_in_screen.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  StorageHelper storageHelper = StorageHelper();

  void savedata() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    String confirmpass = confirmpasswordcontroller.text;


    storageHelper.saveData(context, email, password, confirmpass);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffB81736),
            Color(0xff281537),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 8, right: 8),
                      child: Column(
                        children: [
                          buildTextField('Enter Email', Icon(Icons.email),
                              emailcontroller),
                          SizedBox(
                            height: 30,
                          ),
                          buildTextField('Enter password', Icon(Icons.password),
                              passwordcontroller),
                          SizedBox(
                            height: 30,
                          ),
                          buildTextField('Confirm password',
                              Icon(Icons.password), confirmpasswordcontroller),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: LinearGradient(colors: [
                                  Color(0xffB81736),
                                  Color(0xff281537)
                                ])),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  savedata();
                                },
                                child: Text(
                                  'Sign UP',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Text('Already have a Account?')),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                      builder: (context) {
                                        return LogInScreen();
                                      },
                                    ));
                                  },
                                  child: Text('Log In')))
                        ],
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

  Text buildText() {
    return Text(
      ' Welcome\n Sign UP!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  Widget buildTextField(
      String labeltext, Icon icon, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: const TextStyle(color: Colors.black),
          suffixIcon: icon,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.purple, width: 10),
              borderRadius: BorderRadius.circular(16))),
    );
  }
}
