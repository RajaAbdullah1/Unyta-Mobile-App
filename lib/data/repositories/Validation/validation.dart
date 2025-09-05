class AppValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name is required";
    }
    return null;
  }

  static String? validateBio(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Bio is required";
    }
    if (value.length > 250) {
      return "Bio cannot exceed 250 characters";
    }
    return null;
  }


}
