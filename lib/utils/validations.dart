import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

validatetitle(
  String value,
) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Title must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between title';
  }
}

validateAddress(
  String value,
) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Address must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between Address';
  }
}

validateDesc(
  String value,
) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Description must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between Description';
  }
}

String? validateName(String? value) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Name must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between name';
  }
}

String? validateFirstName(String? value) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'First Name must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between name';
  }
}

String? validateLastName(String? value) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Last Name must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between name';
  }
}

String? validateEventTitle(String? value) {
  if (value == null) {
    return null;
  } else if (value.length < 3) {
    return 'Event title must be more than 2 characters';
  } else if (value.contains('  ')) {
    return 'Double space is not allowed between name';
  }
}

String? validateMobileForEditProfile(String? value) {
// Indian Mobile number are of 10 digit only
  if (value == null) {
    return null;
  } else if (value.length == 0) {
    return 'Cell Phone is required';
  } else if (value.length != 13) return 'Mobile Number must be of 13 digit';
}

String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
  if (value == null) {
    return null;
  } else if (value.length == 0) {
    return ' Cell Phone is required';
  } else if (value.length != 13) return 'Cell Phone must be of 13 digit';
}

// String? validateMobile(String? value) {
// // Indian Mobile number are of 10 digit only
//   if (value == null) {
//     return null;
//   } else if (value.length != 10) return 'Mobile Number must be of 10 digit';
//   if (value.length > 11) return 'Mobile number cannot be more than 11 digits';
//   if (value.contains('-')) {
//     return 'Only numbers are allowed';
//   }
// }

String? validateEmail(String? value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  if (value == '' || value == null) {
    return 'Email is required';
  } else if (value != null && !regex.hasMatch(value)) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

String? validateField(String? value) {
  if (value != null && value.length == 0) {
    return 'Required';
  }
}

String? validateFamilyHistory(String? value) {
  if (value != null && value.length == 0) {
    return 'Family History is Required';
  }
}

String? validateDOB(String? value) {
  if (value != null && value.length == 0) {
    return 'DOB is Required';
  }
}

String? validateAge(String? value) {
  if (value != null && value.length == 0) {
    return 'Age is Required';
  }
}

String? validateNewPassword(String? value, {bool? isSignupField = false}) {
  RegExp regex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  if (value!.length == 0)
    return 'New Password is required';
  else if (value.length < 8)
    return 'New Password should contain atleast 8 characters';
  else if (!regex.hasMatch(value))
    return "New Password should contain at least one uppercase letter, one lowercase letter, one number and one special character";
  else {
    return null;
  }
}

String? validateCurrentPassword(String? value, {bool? isSignupField = false}) {
  if (value!.length == 0)
    return 'Password is required';
  // else if (value.length < 6)
  //   return 'must be greater than 6 characters';
  else
    return null;
}

String? validateForSignupPassword(
  String? value,
) {
  RegExp regex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  if (value!.length == 0)
    return 'Password is required';
  else if (value.length < 8)
    return 'Password should contain atleast 8 characters';
  else if (!regex.hasMatch(value))
    return "Password should contain at least one uppercase letter, one lowercase letter, one number and one special character";
  else {
    return null;
  }
}

String? validateConfirmAndPassword(String? value, String? key,
    {String confirmPass = '', String oldPass = ''}) {
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (confirmPass!.isEmpty)
    return 'Confirm Password is required';
  // else if (confirmPass.length < 8)
  //   return 'Confirm Password should contain atleast 8 characters';
  else if (confirmPass.isNotEmpty && value != confirmPass) {
    return 'New Password and Confirm Password must be same';
  }
  // else if (oldPass.isNotEmpty && oldPass == value) {
  //   return 'New Password must be different from Old Password';
  // }
  else {
    return null;
  }
}

String? validateConfirmAndPasswordForSignUp(String? value, String? key,
    {String confirmPass = '', String oldPass = ''}) {
  RegExp regex = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  if (confirmPass!.length == 0)
    return 'Confirm Password is required';
  // else if (value!.length < 8)
  //   return '$key should contain atleast 8 characters';
  else if (confirmPass.isNotEmpty && value != confirmPass) {
    return 'Password and Confirm Password must be same';
  } else if (oldPass.isNotEmpty && oldPass == value) {
    return 'Password must be different from Old Password';
  } else
    return null;
}

Future<bool> isConnected() async {
  try {
//    final result = await InternetAddress.lookup('example.com');
//    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//      return true;
//    }else
//      return false;
    final result = await InternetAddress.lookup('www.google.com')
        .timeout(Duration(seconds: 3), onTimeout: () {
      return [];
    });
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

void IsConnected(Function(bool) connected) async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connected(true);
    } else {
      connected(false);
    }
  } on SocketException catch (_) {
    connected(false);
  }
}

String formatDate(
    {required DateTime dateTime, String dateFormat = "dd MMM, yyyy"}) {
  // DateTime dateTime = DateFormat("yyyy-MM-dd").parse(dateString);
  return DateFormat(dateFormat).format(dateTime);
}

//Date: 'EEEE, dd MMMM yyyy'  Time: 'hh:mm a'"
String formatTime(String timeString, String timeFormat) {
  DateTime dateTime = DateFormat("H:m").parse(timeString);
  return DateFormat(timeFormat).format(dateTime);
}

String formatDateAndTime(
    {required String dateString, String dateFormat = "MM-dd-yyyy hh:mm a"}) {
  DateTime dateTime = DateFormat("yyyy-MM-dd H:m:s").parse(dateString);
  return DateFormat(dateFormat).format(dateTime);
}

String durationToString(Duration d) {
  /// Returns a formatted string for the given Duration [d] to be DD:HH:mm:ss
  /// and ignore if 0.
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('${days}d');
  }
  if (tokens.isNotEmpty || hours != 0) {
    tokens.add('${hours}h');
  }
  if (tokens.isNotEmpty || minutes != 0) {
    tokens.add('${minutes}m');
  }
  tokens.add('${seconds}s');

  return tokens.join(':');
}

String timeAgoSinceDate(String datetime) {
  DateTime date = new DateFormat("yyyy-MM-dd hh:mm:ss")
      .parse(datetime.replaceAll("T", " ").replaceAll("Z", ""), true)
      .toLocal();
  final date2 = DateTime.now().toLocal();
  final difference = date2.difference(date);

  if (difference.inSeconds < 5) {
    return 'Just now';
  } else if (difference.inSeconds <= 60) {
    return '${difference.inSeconds} seconds ago';
  } else if (difference.inMinutes <= 1) {
    return '1 minute ago';
  } else if (difference.inMinutes <= 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours <= 1) {
    return '1 hour ago';
  } else if (difference.inHours <= 23) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays <= 1) {
    return '1 day ago';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays} days ago';
  } else if ((difference.inDays / 7).ceil() <= 1) {
    return '1 week ago';
  } else if ((difference.inDays / 7).ceil() <= 4) {
    return '${(difference.inDays / 7).ceil()} weeks ago';
  } else if ((difference.inDays / 30).ceil() <= 1) {
    return '1 month ago';
  } else if ((difference.inDays / 30).ceil() <= 30) {
    return '${(difference.inDays / 30).ceil()} months ago';
  } else if ((difference.inDays / 365).ceil() <= 1) {
    return '1 year ago';
  }
  return '${(difference.inDays / 365).floor()} years ago';
}

DateTime convertUTCtoLocal(
    {required String UTCDateString, bool? isMillisecond = false}) {
  DateTime dt;
  if (isMillisecond == true) {
    var milliDT = DateTime.fromMillisecondsSinceEpoch(int.parse(UTCDateString),
        isUtc: true);
    dt = DateTime.parse(
        DateFormat("yyyy-MM-dd HH:mm:ss").format(milliDT.toLocal()));
  } else {
    dt = DateFormat("yyyy-MM-dd HH:mm:ss").parse(UTCDateString, true);
  }
  DateTime dateTimeLocal = dt.toLocal();
  print(dateTimeLocal);
  return dateTimeLocal;
}

bool validateInputs({required GlobalKey<FormState> formKey}) {
  if (formKey.currentState!.validate()) {
//    If all data are correct then save data to out variables
    formKey.currentState!.save();
    return true;
  } else {
//    If all data are not valid then start auto validation.

    return false;
  }
}
