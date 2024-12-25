import 'package:flipkart_project/all_screens/log_in_screen.dart';
import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';

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



  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
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
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(),
                  const SizedBox(
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
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            buildTextField('Enter Email',
                                const Icon(Icons.email), emailcontroller),
                            const SizedBox(
                              height: 30,
                            ),
                            buildTextField('Enter password',
                                const Icon(Icons.password), passwordcontroller),
                            const SizedBox(
                              height: 30,
                            ),
                            buildTextField(
                                'Confirm password',
                                const Icon(Icons.password),
                                confirmpasswordcontroller),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  gradient: const LinearGradient(colors: [
                                    Color(0xffB81736),
                                    Color(0xff281537)
                                  ])),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    saveData();
                                  },
                                  child: const Text(
                                    'Sign UP',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const Align(
                                alignment: Alignment.bottomRight,
                                child: Text('Already have a Account?')),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (context) {
                                          return const LogInScreen();
                                        },
                                      ));
                                    },
                                    child: const Text('Log In')))
                          ],
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

  Text buildText() {
    return const Text(
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
  }void saveData() async {
    String email = emailcontroller.text;
    String password = passwordcontroller.text;
    String confirmPassword = confirmpasswordcontroller.text;
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('This field is required'),
        ),
      );
      return;
    }
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    await storageHelper.saveData(context, email, password, confirmPassword);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sign Up Successful')),
    );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const LogInScreen();
    }));
  }
}
