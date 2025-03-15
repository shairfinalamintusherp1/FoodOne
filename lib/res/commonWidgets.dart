import 'package:flutter/material.dart';
import 'package:foodone/res/color.dart';
import 'package:google_fonts/google_fonts.dart';

Widget commonText(
  String text, {
  Color color = Colors.black,
  double size = 14.0,
  dynamic fontWeigth,
  dynamic softWrap,
  maxline,
  overflow,
  dynamic alinment,
}) {
  return Text(
    text,
    maxLines: maxline,
    softWrap: softWrap,
    textAlign: alinment,
    overflow: overflow,
    style: GoogleFonts.poppins(
      letterSpacing: .5,
      color: color,
      fontSize: size,
      fontWeight: fontWeigth,
    ),
  );
}

Widget commonButton({
  String text = "",
  Color color = primaryColor,
  Color textColor = whiteColor,
  double fontSize = 20.0,
  var width = double.infinity,
  var height = 55.0,
  VoidCallback? onPressedButton,
}) {
  return InkWell(
    onTap: onPressedButton,
    child: Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(child: commonText(text, size: 16, color: textColor)),
    ),
  );
}

Widget commonTextField({
  String text = "",
  dynamic maxLine,
  prefixIxon,
  TextEditingController? controller,
  keyboardType = TextInputType.text,
  double width = double.infinity,
  Color color = Colors.grey,
  double borderRadious = 8.0,
  dynamic onchanged,
  double? height,
}) {
  return Container(
    width: width,
    height: height,
    child: TextField(
      maxLines: maxLine,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onchanged,
      decoration: InputDecoration(
        prefixIcon: prefixIxon,
        hintText: text,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: color),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: color),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: color),
          borderRadius: BorderRadius.circular(borderRadious),
        ),
      ),
    ),
  );
}

Future commonNavigation(
  BuildContext context, {
  required Widget pageName,
  bool onlyPush = false,
}) {
  if (onlyPush) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => pageName,
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  } else {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => pageName,
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
      ),
    );
  }
}

dynamic commonSnackBar(context, {massage}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massage),
      duration: const Duration(
        seconds: 2,
      ), // Duration for which the SnackBar is displayed
    ),
  );
}

dynamic progressBarCustom(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) {
      return const Center(child: CircularProgressIndicator());
    },
  );
}

Future<dynamic> slideNavigationLeftToRightPush(
  Widget page,
  BuildContext context,
) {
  return Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    ),
  );
}

class RatingStar extends StatelessWidget {
  final double rating;
  final int maxRating;
  final IconData filledStar;
  final IconData emptyStar;
  final Color starColor;

  const RatingStar({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledStar = Icons.star,
    this.emptyStar = Icons.star_border,
    this.starColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        if (index < rating) {
          return Icon(filledStar, color: starColor);
        } else {
          return Icon(emptyStar, color: starColor);
        }
      }),
    );
  }
}

String? nameValidity(String? value) {
  if (value!.isEmpty) {
    return "this field required";
  } else if (!(RegExp(r'^[a-z A-Z]{2,}$').hasMatch(value))) {
    return "invalid name";
  } else {
    return null;
  }
}

String? numberValidity(String? value) {
  if (value!.isEmpty) {
    return "this field required";
  }
  if (value.length < 11 && value.isNotEmpty) {
    return "Enter valid number";
  } else {
    return null;
  }
}

String? emailValidity(String? value) {
  if (value!.isEmpty) {
    return "this field required";
  }
  if (!(RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  ).hasMatch(value))) {
    return "invalid email";
  } else {
    return null;
  }
}

String? passwordValidity(String? value) {
  RegExp capitalLetterPattern = RegExp(r'[A-Z]');
  RegExp smallLetterPattern = RegExp(r'[a-z]');
  RegExp numberPattern = RegExp(r'\d');

  if (!capitalLetterPattern.hasMatch(value!) ||
      !smallLetterPattern.hasMatch(value) ||
      !numberPattern.hasMatch(value) ||
      value.length <= 8) {
    return "weak password";
  } else {
    null;
  }
  return null;
}
