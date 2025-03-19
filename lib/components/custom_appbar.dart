import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'PSU-BUS',
        style: TextStyle(
          color: Colors.indigo, // สีตัวอักษร
          fontSize: 24, // ปรับขนาดใหญ่ขึ้นเพื่อความโดดเด่น
          fontWeight: FontWeight.w900, // ทำให้ตัวอักษรหนาที่สุด
          letterSpacing: 2, // เพิ่มช่องไฟให้ดูโมเดิร์น
        ),
      ),
      centerTitle: false, // จัด title ให้อยู่ตรงกลาง
      backgroundColor: Colors.white, // สีพื้นหลัง AppBar
      elevation: 6, // เพิ่มเงาให้ดูมีมิติ
      shadowColor: Colors.indigo.withOpacity(0.4), // ใช้เงาสีน้ำเงินอ่อน
      actions: [
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: Colors.indigo,
            size: 30,
          ),
          onPressed: () {
            // ไปยังหน้า User Profile
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
