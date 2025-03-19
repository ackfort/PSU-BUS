import 'package:flutter/material.dart';
import 'package:psu_bus/components/custom_appbar.dart';

class BusRoutePage extends StatelessWidget {
  const BusRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // ตั้งค่าพื้นหลังของ Scaffold
      appBar: CustomAppBar(),
      body: const Center(
        child: Text('BusRoutePage'),
      ),
    );
  }
}