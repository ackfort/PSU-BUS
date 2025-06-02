import 'package:flutter/material.dart';
import 'package:psu_bus/theme/app_colors.dart';

class PSUAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PSUAppBar({super.key, this.title = 'Prince of Songkla University'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.deepBlue,
      elevation: 20.0, // 🌟 เพิ่มเงา
      shadowColor: Colors.black.withOpacity(0.4), // ปรับสีเงาให้ดูนุ่ม
      title: Row(
        children: [
          const Icon(Icons.school, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
