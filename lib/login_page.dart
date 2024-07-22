import 'package:fleetfeast/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(94, 245, 205, 85),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(182, 209, 221, 0.6),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 80.0),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30.0),
                      child: Column(children: <Widget>[
                        Text("Welcome Back",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(65, 118, 140, 1),
                            )),
                        SizedBox(height: 2.0),
                        Text("Login to your account",
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w100,
                              color: Color.fromRGBO(134, 134, 134, 1),
                            )),
                        SizedBox(height: 35.0),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(93, 166, 198, 0.14),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(93, 166, 198, 0.34),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(93, 166, 198, 0.34),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              labelText: 'Mobile No.',
                              labelStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(53, 99, 119, 1),
                              )),
                        ),
                        SizedBox(height: 12.0),
                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(93, 166, 198, 0.14),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 10.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(93, 166, 198, 0.34),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(93, 166, 198, 0.34),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                fontSize: 12.0,
                                color: Color.fromRGBO(53, 99, 119, 1),
                              )),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: double.infinity,
                          height: 40.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(82, 151, 181, 1),
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text('Submit'),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()),
                              ); // Navigate back to login page
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w100,
                                  color: Color.fromRGBO(134, 134, 134, 1),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Sign Up ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(82, 151, 181, 1)),
                                  ),
                                ],
                              ),
                            )),
                      ])),
                ),
              ),
            ]),
      ),
    );
  }
}
