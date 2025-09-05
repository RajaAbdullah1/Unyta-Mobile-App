import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:unyta/core/styles/app_colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/LableArrowButton/lable_arrow_button.dart';

class SignupMethodScreen extends StatelessWidget {
  const SignupMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(leading: IconButton(
          onPressed: ()=>  Navigator.pop(context),
          icon: const Icon(Icons.arrow_back))),
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sign up as Creator",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Get access to exclusive partnerships, gifted products, and complimentary experiences.",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color:  Theme.of(context).colorScheme.onSecondary),
              ),
              SizedBox(height: 20),
              LabelArrowButton(
                backgroundColor: Theme.of(context).colorScheme.surface,
                textColor: Colors.black,
                borderColor: AppColors.border,
                text: "Use Email or Phone Number",
                labelAlignment: "center", // text start me
                startImage: Image.asset("assets/images/sms.png", height: 20),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signupScreen,);
                },
              ),
              SizedBox(height: 20),
              Center(child: Text("Or", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onSecondary,))),
              SizedBox(height: 20),
              LabelArrowButton(
                backgroundColor: Theme.of(context).colorScheme.surface,
                textColor:  Colors.black,
                borderColor: AppColors.border,
                text: "Continue with Google",
                labelAlignment: "center", // text start me
                startImage: Image.asset("assets/images/google.png", height: 20),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              LabelArrowButton(
                backgroundColor:  Theme.of(context).colorScheme.surface,
                textColor:  Colors.black,
                borderColor: AppColors.border,
                text: "Continue With Apple",
                labelAlignment: "center", // text start me
                startImage: Image.asset("assets/images/apple.png", height: 20),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSecondary),
                    children: [
                      const TextSpan(text: "By signing up, you agree to "),
                      TextSpan(
                        text: "Unyta's Terms of Service",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Open Terms of Service page
                          },
                      ),
                      const TextSpan(text: "\n& "), // newline here
                      TextSpan(
                        text: "Privacy Policy",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Open Privacy Policy page
                          },
                      ),
                    ],
                  ),
                ),
              ),
             Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color:  Theme.of(context).colorScheme.onSecondary),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginScreen);
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
