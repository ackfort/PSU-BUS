// lib/components/custom_popup.dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomPopup {
  static void show(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6), // ปรับความทึบของพื้นหลัง
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(
            255,
            250,
            250,
            250,
          ), // พื้นหลังของ popup เอง
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'ตกลง',
                style: TextStyle(color: Color.fromARGB(255, 250, 250, 250)),
              ),
            ),
          ],
        );
      },
    );
  }
}
