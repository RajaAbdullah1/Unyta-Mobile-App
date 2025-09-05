import 'package:flutter/material.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/LableArrowButton/lable_arrow_button.dart';

class SignUpAsBrand extends StatelessWidget {
  final String role;
  const SignUpAsBrand({super.key, required  this.role});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                "Sign up as a $role",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Connect with exclusive creators and run authentic collaborations that drive real engagement.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              SizedBox(height: 20),
              LabelArrowButton(
                borderColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                textColor: Theme.of(context).colorScheme.primary,
                startImage: Image.asset(
                  "assets/images/sms.png",
                  height: 24,
                  width: 24,
                ),
                text: "Use Email or Phone Number",
                labelAlignment: "center",
                onPressed: () {
                  Navigator.pushNamed(context,   AppRoutes.signupScreen, arguments: role == "Brand"  ? "brand" : "creator");
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Or",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              LabelArrowButton(
                borderColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                textColor: Theme.of(context).colorScheme.primary,
                startImage: Image.asset(
                  "assets/images/google.png",
                  height: 24,
                  width: 24,
                ),
                text: "Continue with Google",
                labelAlignment: "center",
                onPressed: () {},
              ),
              SizedBox(height: 10),
              LabelArrowButton(
                borderColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surfaceBright,
                textColor: Theme.of(context).colorScheme.primary,
                startImage: Image.asset(
                  "assets/images/apple.png",
                  height: 24,
                  width: 24,
                ),
                text: "Continue with Apple",
                labelAlignment: "center",
                onPressed: () {},
              ),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By continuing, you agree to Unyta's  ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: "Terms of Service",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " and ",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                    TextSpan(
                      text: "Privacy policy",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(EdgeInsets.zero),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginScreen, arguments: role);
                    },
                    child: Text(
                      "Login",
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
      ),
    );
  }
}
