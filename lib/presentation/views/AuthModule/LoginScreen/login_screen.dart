import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/data/repositories/Validation/validation.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../../provider/LoginProvider/login_provider.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  final String role;
  const LoginScreen({super.key, required this.role});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  void _onLogin() {
    // if (_formKey.currentState!.validate()) {
    if(widget.role == "Creator")
      {
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      }else{
      Navigator.pushNamed(context, AppRoutes.brandHomePage);
    }
    // }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider  = Provider.of<LoginProvider>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(leading: const Icon(Icons.arrow_back)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Scrollable Form content
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                      "Unlock exclusive collaborations. From gifted products and curated experiences to authentic content creation.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        controller: _emailController,
                        hintText: "Enter your email address",
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidation.validateEmail,
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                          controller: _passwordController,
                          hintText: "Enter your password",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: provider.isPasswordVisible,
                          validator: AppValidation.validatePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.togglePasswordVisibility();
                            },
                            icon: Icon(!provider.isPasswordVisible ?  Icons.remove_red_eye_rounded  : CupertinoIcons.eye_slash , color: Theme.of(context).colorScheme.onSecondary, ),
                          )
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Button & Footer always at bottom
            ElevatedButton(
              onPressed: _onLogin,
              child: const Text("Login Screen"),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary
                  ),
                  children: [
                    const TextSpan(text: "By signing up, you agree to "),
                    TextSpan(
                      text: "Unyta's Terms of Service",
                      style: Theme.of(context).textTheme.bodyMedium,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    const TextSpan(text: "\n& "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: Theme.of(context).textTheme.bodyMedium,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:Theme.of(context).colorScheme.onSecondary
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signupScreen, arguments: "creator");
                  },
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
