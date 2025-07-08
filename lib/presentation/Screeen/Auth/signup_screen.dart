import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/Common/custom_button.dart';
import 'package:flutter_application_1/Core/Common/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
   bool _ispasswordVisible=false;
  final _nameFocus=FocusNode();
  final _usernameFocus=FocusNode();
  final _emailFocus=FocusNode();
  final _passwordFocus=FocusNode();
  final _phoneFocus=FocusNode();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    _nameFocus.dispose();
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _phoneFocus.dispose();

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
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Creat Account",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Please fill in the details to continue",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,fontSize: 12, color: Colors.grey
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: nameController,
                    focusNode: _nameFocus,
                  hintText: "Full Name",
                  obscureText: false,
                  prefixIcon: Icon(Icons.person_outline),
                  validator: (value)=>validateName(value, "Enter Full Name"),
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: usernameController,
focusNode: _usernameFocus,
                  hintText: "UserName",
                  obscureText: false,
                  prefixIcon: Icon(Icons.alternate_email),
                  validator: (value)=>validateName(value, "Enter  Username"),
                ),

                SizedBox(height: 16),
                CustomTextField(
                  controller: emailController,
                  focusNode: _emailFocus,
               
                  hintText: "Email",
                  obscureText: false,
                  prefixIcon: Icon(Icons.email_outlined),
                  validator: validateEmail
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: phoneController,
                   focusNode: _phoneFocus,
                  hintText: "Phone Number",
                  // obscureText: false,
                  prefixIcon: Icon(Icons.phone_outlined),
                  validator: (value)=>validateName(value, "Enter Phone Name"),
                ),
                SizedBox(height: 16),

                CustomTextField(
                  controller: passwordController,
focusNode: _passwordFocus,
                  hintText: "Password",
                  obscureText: _ispasswordVisible,
                  prefixIcon:IconButton(onPressed: (){
                    setState(() {
                      _ispasswordVisible= !_ispasswordVisible;
                    });
                  }, icon: Icon(_ispasswordVisible?Icons.visibility_off:Icons.visibility)),
                  validator:validatePassword,
                ),

                SizedBox(height: 25),
                CustomButton(onpressed: () {

                  FocusScope.of(context).unfocus();
                  if(_formKey.currentState?.validate()?? false){}
                }, text: "Create Account"),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account ? ",
                      style: TextStyle(color: Colors.grey[600]),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pop(context);
                          },
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
