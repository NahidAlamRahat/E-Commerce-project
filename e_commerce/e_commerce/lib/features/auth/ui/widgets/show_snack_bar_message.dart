import 'package:flutter/material.dart';

ShowSnackBarMessage(message, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content:  Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      margin: const EdgeInsets.only(bottom: 30, left: 50, right: 50),
      elevation: 0,
    ),
  );
}



