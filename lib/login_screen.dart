import 'package:fixatease_worker/services/auth_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utilities/constants.dart';
import 'utilities/form_utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Hero(
          tag: 'title',
          child: Text(
            'Fix@ease',
            style: GoogleFonts.cookie(
              textStyle: const TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 40.0),
            ),
          ),
        ),
        leading:
            Hero(tag: 'logo', child: Image.asset("assets/images/Logo_t.png")),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Repair-tools.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Container(
              //   height: double.infinity,
              //   width: double.infinity,
              //   decoration: const BoxDecoration(
              //     gradient: LinearGradient(
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //       colors: [
              //         Color(0xFF73AEF5),
              //         Color(0xFF61A4F1),
              //         Color(0xFF478DE0),
              //         Color(0xFF398AE5),
              //       ],
              //       stops: [0.1, 0.4, 0.7, 0.9],
              //     ),
              //   ),
              // ),

              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 55.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        buildEmailTF('Email', 'Enter your email'),
                        const SizedBox(
                          height: 30.0,
                        ),
                        buildPasswordTF('Password', 'Enter your password'),
                        // _buildForgotPasswordBtn(),
                        // _buildRememberMeCheckbox(),
                        buildBtn('Login', context),
                        // _buildSignInWithText(),
                        const SizedBox(
                          height: 30.0,
                        ),
                        buildSignupBtn(context),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
