import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:precises/constant.dart';
import 'package:precises/screens/signup.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: LoginForm(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/img_1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? _passwordError;
  String? _emailError;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 12,
        ),
        child: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/image/logo.png',
                    height: 77,
                    width: 156,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.getFont(
                        'Plus Jakarta Sans',
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back! Please Enter Your Details',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Email',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    // cursorColor: appColor,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: appColor),
                      //   borderRadius: BorderRadius.circular(7),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.getFont(
                        "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff677487),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                          color: appColor,
                          // width: 2.0,
                        ),
                      ),
                      errorText: _emailError,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address';
                      }
                      if (!isValidEmail(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _emailError = null;
                      });
                    },
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: TextFormField(
                    // cursorColor: appColor,
                    decoration: InputDecoration(
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: appColor),
                      //   borderRadius: BorderRadius.circular(7),
                      // ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.getFont(
                        "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff677487),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                          color: appColor,
                          // width: 2.0,
                        ),
                      ),
                      errorText: _passwordError,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      setState(
                        () {
                          _passwordError = null;
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Demo',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff37474F),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password ?',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: appColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        setState(() {
                          _passwordError = 'Please enter a valid password';
                        });
                        return;
                      }
                      // Do something when the button is pressed
                      if (!_formKey.currentState!.validate()) {
                        setState(() {
                          _emailError =
                              'Please enter a valid email address';
                        });
                        return;
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: RichText(
                    text: TextSpan(
                        text: 'Don’t have account ?  ',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                              Get.to(SignUpScreen());
                              },
                            text: 'Sign Up',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: appColor,
                            ),
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    // Use a regular expression to validate email format
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
