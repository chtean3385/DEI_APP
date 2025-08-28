import 'package:flutter/cupertino.dart';

class AppValidators {
  static FormFieldValidator<String> empty = (value) {
    if (value == null || value.isEmpty) {
      return 'Please fill';
    }
    return null;
  };
  static FormFieldValidator<String> fieldEmpty(String fieldName) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter ${fieldName.toLowerCase()}';
      }
      return null;
    };
  }
  static FormFieldValidator<String> fullName = (value) {
    if (value == null || value.isEmpty) {
      return  'Please enter your full name';
    }
    return null;
  };

  static FormFieldValidator<String> email = (value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  };

  static FormFieldValidator<String> password = (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (value.contains(' ')) {
      return 'Password must not contain whitespace';
    }
    return null;
  };
  static FormFieldValidator<String> confirmPassword(TextEditingController passwordController) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters long';
      } else if (value.contains(' ')) {
        return 'Password must not contain whitespace';
      } else if (value != passwordController.text.trim()) {
        return 'Passwords do not match';
      }
      return null;
    };
  }
  static FormFieldValidator<String> phone = (value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  };
  static FormFieldValidator<String> validateYears = (value) {
    print("year -- $value");

    if (value == null || value.isEmpty) {
      return 'Please enter years';
    }

    final num? years = int.tryParse(value);
    if (years == null) {
      return 'Enter a valid number';
    }

    if (years < 0) {
      return 'Years cannot be negative';
    }

    if (value.length > 2) {
      return 'Years cannot exceed 99';
    }

    // Disallow "00" or leading zeros
    if (years == 0) {
      return 'Years cannot be zero';
    }
    if (value.startsWith("0") && value.length > 1) {
      return 'Remove leading zeros';
    }

    return null;
  };
  static FormFieldValidator<String> validateMonths = (value) {
    print("validateMonths -- $value");

    if (value == null || value.isEmpty) {
      return 'Please enter months';
    }

    final int? months = int.tryParse(value);
    if (months == null) {
      return 'Enter a valid number';
    }

    if (months < 0) {
      return 'Cannot be negative';
    }

    if (months > 11) {
      return 'cannot be more than 11';
    }

    return null;
  };

}
