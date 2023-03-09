import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:precises/constant.dart';
import 'package:precises/screens/login.dart';

class SignUpScreen extends StatelessWidget {
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  // String? _confirmPasswordError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                      'Sign Up',
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
                      'Name',
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
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: GoogleFonts.getFont(
                          "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff677487),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nameError = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: GoogleFonts.getFont(
                          "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff677487),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address.';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email address.';
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
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: GoogleFonts.getFont(
                          "Poppins",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff677487),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        )),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      final passwordRegex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      if (!passwordRegex.hasMatch(value)) {
                        return 'Password should be at least 8 characters, \none uppercase, one lowercase, and one number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _passwordError = value;
                    },
                  ),
                ),
                SizedBox(height: 35.0),
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColor,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Do something with the input
                        print('Name: $_nameError');
                        print('Email: $_emailError');
                        print('Password: $_passwordError');
                      }
                    },
                    child: Text(
                      'Sign Up',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                          text: 'Sign In',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: appColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
