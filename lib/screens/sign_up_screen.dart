import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_in_screen.dart';
import 'onboarding_screen.dart';
import '../widgets/elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();

  bool _isPasswordVisible = false;

  void _handleShowPassword() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _handleGoBack() {
    Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              const OnboardingScreen(isOnboardingDone: true),
        ));
  }

  void _handleGoToSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  void _handleSubmit() async {
    if (_signUpFormKey.currentState!.validate()) {
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
          child: const Icon(
            Icons.arrow_back,
            color: Color(0xFF090F47),
          ),
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
                        key: _signUpFormKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(bottom: 24),
                                child: const Text(
                                  "Create your account",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Color(0xFF090F47)),
                                ),
                              ),
                              Container(
                                height: 48,
                                margin: const EdgeInsets.only(bottom: 16),
                                child: TextFormField(
                                  cursorColor: const Color(0xFF090F47),
                                  decoration: const InputDecoration(
                                    labelText: "Your Name",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
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
                                margin: const EdgeInsets.only(bottom: 16),
                                child: TextFormField(
                                  cursorColor: const Color(0xFF090F47),
                                  decoration: const InputDecoration(
                                    labelText: "Mobile Number",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
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
                                margin: const EdgeInsets.only(bottom: 16),
                                child: TextFormField(
                                  cursorColor: const Color(0xFF090F47),
                                  decoration: const InputDecoration(
                                    labelText: "Email",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
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
                                child: TextFormField(
                                  obscureText: _isPasswordVisible,
                                  cursorColor: const Color(0xFF090F47),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(5, 0, 56, 0),
                                    suffixIcon: GestureDetector(
                                      onTap: _handleShowPassword,
                                      child: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color.fromRGBO(
                                            9, 15, 71, 0.45),
                                        size: 16,
                                      ),
                                    ),
                                    labelStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(9, 15, 71, 0.45),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(9, 15, 71, 0.1),
                                      ),
                                    ),
                                    focusedBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF4157FF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButtonWidget(
                                text: "Create Account",
                                isUpperCase: true,
                                onPressed: _handleSubmit,
                              ),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: _handleGoToSignIn,
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
                                "Already have account?  Login",
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
