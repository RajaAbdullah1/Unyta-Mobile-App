import 'package:flutter/material.dart';
import 'package:unyta/data/repositories/Validation/validation.dart';
import 'package:unyta/routes/app_routes.dart';
import '../../../widgets/TextFieldWidget/text_field_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  void _forgotPassword() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.emailSentScreen);
      debugPrint("Signup successful");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Forgot Your Password?",
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "We’ll help you reset it in a few quick steps.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:Theme.of(context).colorScheme.onSecondary
                        ),
                      ),
                      const SizedBox(height: 30),

                      TextFieldWidget(
                        controller: _emailController,
                        hintText: "Enter your email address",
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidation.validateEmail,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signupScreen);
                        },
                        child: Text(
                          "Enter the email linked to your account",
                          style: Theme.of(context).textTheme.bodyLarge!
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Button & Footer always at bottom
            ElevatedButton(
              onPressed: _forgotPassword,
              child: const Text("Send Reset Link"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Remember Password? ",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color:Theme.of(context).colorScheme.onSecondary),
                ),
                TextButton(
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.loginScreen);
                  },
                  child: Text(
                    "Login Screen",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
