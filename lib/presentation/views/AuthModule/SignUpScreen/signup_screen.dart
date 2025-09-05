import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unyta/data/repositories/Validation/validation.dart';

import '../../../../provider/SignUpProvider/sign_up_provider.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  final String role;
  const SignupScreen({super.key, required this.role});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _instagramController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _instagramController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        onPressed: ()=>  Navigator.pop(context),
          icon: const Icon(Icons.arrow_back))),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: widget.role.contains("brand")
                    ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.role.contains("brand")
                        ? "Sign up as Brand"
                        : "Sign up as Creator",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: widget.role.contains("brand") ? TextAlign.center : TextAlign.left,
                    widget.role.contains("brand")
                        ? "Match with  top-tier creators and launch authentic partnerships that drive real engagement."
                        : "Get access to exclusive partnerships, gifted products, and complimentary experiences.",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Full Name
                  TextFieldWidget(
                    controller: _fullNameController,
                    hintText:
                        widget.role.contains("brand")
                            ? "Brand Name"
                            : "Enter your full name",
                    keyboardType: TextInputType.name,
                    validator: (value) => AppValidation.validateName("Name"),
                  ),
                  const SizedBox(height: 20),

                  // Email Address
                  TextFieldWidget(
                    controller: _emailController,
                    hintText:
                        widget.role.contains("brand")
                            ? "Business Email"
                            : "Enter your email address",
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidation.validateEmail,
                  ),
                  const SizedBox(height: 20),

                  // Instagram Handle
                  TextFieldWidget(
                    controller: _instagramController,
                    hintText: "Enter your Instagram handle",
                    keyboardType: TextInputType.text,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Image.asset(
                        "assets/images/info.png",
                        height: 10,
                        width: 10,
                      ),
                    ),
                    validator:
                        (value) =>
                            AppValidation.validateName("Instagram Handle"),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.role.contains("brand")
                          ? "Helps creators verify your brand identity"
                          : "For account verification",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password
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
                  const SizedBox(height: 20),

                  // Confirm Password
                  TextFieldWidget(
                    controller: _confirmPasswordController,
                    hintText: "Confirm your password",
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: provider.isConfirmPasswordVisible,
                    validator: AppValidation.validatePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          provider.toggleConfirmPasswordVisibility();
                        },
                        icon: Icon(!provider.isPasswordVisible ?  Icons.remove_red_eye_rounded  : CupertinoIcons.eye_slash , color: Theme.of(context).colorScheme.onSecondary, ),
                      )
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed:
                        () => provider.onSignup(_formKey, context, widget.role),
                    child: const Text("Create Account"),
                  ),

                  const SizedBox(height: 20),

                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        children: [
                          const TextSpan(text: "By signing up, you agree to "),
                          TextSpan(
                            text: "Unyta's Terms of Service",
                            style: Theme.of(context).textTheme.bodyMedium,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Open Terms of Service page
                                  },
                          ),
                          const TextSpan(text: "\n& "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: Theme.of(context).textTheme.bodyMedium,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Open Privacy Policy page
                                  },
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
                        "Already have an account?",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.loginScreen, arguments:
                          widget.role.contains("brand")
                              ? "Brand" : "Creator");
                        },
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
