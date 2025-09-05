import '../../models/SafetyPolicyModel/safety_policy_model.dart';

class SafetyPolicyContent {
  static final SafetyPolicyModel creator = SafetyPolicyModel(
    title: "Stay Safe While Collaborating",
    subtitle:
    "We’re committed to creating a secure and respectful space for every creator",
    bullets: [
      "Only accept products or experiences from verified brands on the platform",
      "Never share personal contact details outside the platform chat",
      "Report suspicious behavior directly through the campaign tracker",
      "Reviews are moderated to protect both creators and brands",
      "You have full control over which collaborations to accept or decline",
    ],
  );

  static final SafetyPolicyModel brand = SafetyPolicyModel(
    title: "Ensure Safe & Ethical Collaborations",
    subtitle:
    "Help us build trust with creators by committing to respectful and secure practices",
    bullets: [
      "Only contact creators through the platform",
      "Avoid requesting content outside of agreed campaign terms",
      "Provide clear, respectful briefs and set realistic deadlines",
      "Report any concerns to our support team",
      "Violations may result in account suspension or removal",
    ],
  );

  static SafetyPolicyModel getContent(String role) {
    return role == "brand" ? brand : creator;
  }
}
