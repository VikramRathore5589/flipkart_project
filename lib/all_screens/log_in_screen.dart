import 'package:flipkart_project/core(common%20files)/functions.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
final helper=StorageHelper();
void login()async{
    String email=emailcontroller.text;
    String password=passwordcontroller.text;
    helper.getData(context, email, password);
  }

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
                      child: Column(
                        children: [
                          buildTextField('Enter Email', emailcontroller,
                              const Icon(Icons.email)),
                          const SizedBox(
                            height: 20,
                          ),
                          buildTextField('Enter Password', passwordcontroller,
                              const Icon(Icons.password)),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                gradient: const LinearGradient(colors: [
                                  Color(0xffB81736),
                                  Color(0xff281537)
                                ])),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  login();
                                },
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
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
    return const Text(
      'Welcome\n LOG IN!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  TextField buildTextField(
      String labeltext, TextEditingController controller, Icon icon) {
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
