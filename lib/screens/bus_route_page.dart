import 'package:flutter/material.dart';
import 'package:psu_bus/components/custom_appbar.dart';

class BusRoutePage extends StatelessWidget {
  const BusRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              'assets/images/PSU-Bus-Routes.jpg', // ระบุ path ของรูปภาพ
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
