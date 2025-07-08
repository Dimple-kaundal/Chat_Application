import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/Common/custom_button.dart';
import 'package:flutter_application_1/Core/Common/custom_text_field.dart';
import 'package:flutter_application_1/presentation/Screeen/Auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey =GlobalKey<FormState>();
  final _emailFocus=FocusNode();
  final _passwordFocus=FocusNode();
  bool _ispasswordVisible=false;
  
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
  String? validateName(String? value, String errorMessage) {
  if (value == null || value.trim().isEmpty) {
    return errorMessage;
  }
  return null;
}
String? validateEmail(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter your email";
  }

  final emailRegx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegx.hasMatch(value.trim())) {
    return "Please enter a valid email address (e.g., example@email.com)";
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter a password";
  }

  if (value.trim().length < 6) {
    return "Password must be at least 6 characters long";
  }

  return null;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding:EdgeInsets.symmetric(horizontal: 20.0) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Sign in to Continue",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: emailController,
                   focusNode: _emailFocus,
                  hintText: "Email",
                  obscureText: false,
                  validator: validateEmail,
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                   focusNode: _passwordFocus,
                  hintText: "Password",
                  validator: validatePassword,
                  obscureText: !_ispasswordVisible,
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon:IconButton(onPressed: (){
                    setState(() {
                      _ispasswordVisible=!_ispasswordVisible;
                    });
                  }, icon: Icon(_ispasswordVisible?Icons.visibility_off:Icons.visibility))
                ),
                SizedBox(height: 30),
                CustomButton(onpressed: () {
                  FocusScope.of(context).unfocus();
                   if(_formKey.currentState?.validate()?? false){}
                }, text: 'Login'),
                SizedBox(height: 20,),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have and account ?",
                      style: TextStyle(color: Colors.grey[600]),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap=(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                          }
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
}
