// import 'package:bus/constant/colors.dart';
// import 'package:bus/core/utils/validation.dart';
// import 'package:flutter/material.dart';
//
// class MyTextField extends StatefulWidget {
//   const MyTextField({
//     Key? key,
//     this.maxLength,
//      this.onChanged,
//     required this.controller,
//     this.validator,
//      this.requireStartsWith09,
//      this.requireNumeric,
//      this.requireTenDigits,
//      this.requireNotEmpty,
//      this.requireAtLastDigits,
//   }) : super(key: key);
//   final int? maxLength;
//   final Function(String?)? onChanged;
//   final TextEditingController controller;
//   final Function(String?)? validator;
//   final bool? requireStartsWith09;
//   final bool? requireNumeric;
//   final bool? requireTenDigits;
//   final bool? requireNotEmpty;
//   final bool? requireAtLastDigits;
//
//   @override
//   State<MyTextField> createState() => _MyTextFieldState();
// }
//
// class _MyTextFieldState extends State<MyTextField> {
//   String? errorMessage;
//
//   void showError(String message) {
//     setState(() {
//       errorMessage = message;
//     });
//   }
//
//   OutlineInputBorder _customInputBorder(Color color) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: BorderSide(color: color, width: 2.0),
//     );
//   }
//
//   void clearError() {
//     setState(() {
//       errorMessage = null;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLength: widget.maxLength,
//       onChanged: (value) {
//         String? validationMessage = Validator.validateInput(
//           value,
//           requireStartsWith09: widget.requireStartsWith09!,
//           requireTenDigits: widget.requireTenDigits!,
//         );
//         if (validationMessage != null) {
//           showError(validationMessage);
//         } else {
//           clearError();
//         }
//       },
//       decoration: InputDecoration(
//         hintText: ' رقم الجوال',
//         border: InputBorder.none,
//         errorText: errorMessage,
//         errorStyle: TextStyle(fontSize: 14, color: Colors.red),
//         errorBorder: _customInputBorder(Colors.red),
//         focusedErrorBorder: _customInputBorder(Colors.red),
//         enabledBorder: _customInputBorder(Colors.grey),
//         focusedBorder: _customInputBorder(text2),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//       ),
//       controller: widget.controller,
//       validator: (value) {
//         return Validator.validateInput(
//           value,
//           requireStartsWith09: widget.requireStartsWith09!,
//           requireNumeric: widget.requireNumeric!,
//           requireTenDigits:widget.requireTenDigits!,
//           requireNotEmpty: widget.requireNotEmpty!,
//         );
//       },
//     );
//   }
// }
