import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/elevated_button.dart';
import 'onboarding_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signInFormKey = GlobalKey<FormState>();

  void _handleGoBack() {
    Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              const OnboardingScreen(isOnboardingDone: true),
        ));
  }

  void _handleGoToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }

  void _handleSubmit() async {
    if (_signInFormKey.currentState!.validate()) {
      final pref = await SharedPreferences.getInstance();
      pref.setBool("isOnboardingDone", false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        toolbarHeight: 32,
        leading: GestureDetector(
          onTap: _handleGoBack,
          child: const Icon(Icons.arrow_back, color: Color(0xFF090F47)),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight - 24,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 24),
                                child: const Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: Color(0xFF090F47),
                                  ),
                                ),
                              ),
                              Container(
                                height: 48,
                                margin: const EdgeInsets.only(bottom: 16),
                                child: TextFormField(
                                  cursorColor: const Color(0xFF090F47),
                                  decoration: const InputDecoration(
                                    labelText: "Username",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
                                    prefixIcon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Color(0xFF090F47),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(9, 15, 71, 0.45),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(9, 15, 71, 0.1),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF4157FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 48,
                                margin: const EdgeInsets.only(bottom: 24),
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      obscureText: true,
                                      cursorColor: const Color(0xFF090F47),
                                      decoration: const InputDecoration(
                                        labelText: "Password",
                                        contentPadding:
                                            EdgeInsets.fromLTRB(5, 0, 56, 0),
                                        prefixIcon: Icon(
                                          Icons.lock_outline,
                                          color: Color(0xFF090F47),
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(9, 15, 71, 0.45),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                Color.fromRGBO(9, 15, 71, 0.1),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF4157FF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: GestureDetector(
                                        onTap: () => print("object"),
                                        child: const Text(
                                          "Forgot?",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Color.fromRGBO(9, 15, 71, 0.45),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButtonWidget(
                                text: "Login",
                                isUpperCase: true,
                                onPressed: _handleSubmit,
                              ),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 40),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: _handleGoToSignUp,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Color.fromRGBO(9, 15, 71, 0.45),
                                size: 13,
                              ),
                              SizedBox(width: 9),
                              Text(
                                "Don’t have an account? Sign Up",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(9, 15, 71, 0.45),
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
