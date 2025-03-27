import 'package:flutter/material.dart';
import 'package:psu_bus/components/custom_appbar.dart';
import 'package:psu_bus/components/density_card.dart';

class PassengerDensityPage extends StatelessWidget {
  const PassengerDensityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // ตั้งค่าพื้นหลังของ Scaffold
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // กำหนดระยะห่างจากขอบ
        child: ListView(
          children: [
            // การ์ด 1
            DensityCard(
              busStopName: "Central Station1",
              density: "High Density",
              passengerCount: 15,
            ),
            const SizedBox(height: 16), // ระยะห่างระหว่างการ์ด
            // การ์ด 2
            DensityCard(
              busStopName: "Central Station2",
              density: "Medium Density",
              passengerCount: 25,
            ),
            const SizedBox(height: 16), // ระยะห่างระหว่างการ์ด
            // การ์ด 3
            DensityCard(
              busStopName: "Central Station3",
              density: "Low Density",
              passengerCount: 5,
            ),
            DensityCard(
              busStopName: "BUS-1",
              density: "Low Density",
              passengerCount: 5,
            ),
            DensityCard(
              busStopName: "BUS-2",
              density: "Low Density",
              passengerCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
