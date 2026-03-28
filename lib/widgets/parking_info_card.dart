import 'package:flutter/material.dart';

class ParkingInfoCard extends StatelessWidget {
  const ParkingInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(22),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10),
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    'Strada Pușkin 32MD-2025, Chișinău',
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '20.8 MDL',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.access_time, size: 18),
                    SizedBox(width: 4),
                    Text('9 min'),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.alt_route, size: 18),
                    SizedBox(width: 4),
                    Text('500 m'),
                  ],
                ),
                Row(
                  children: const [
                    Icon(Icons.local_parking, size: 18),
                    SizedBox(width: 4),
                    Text('Free'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),

            const Text(
              'By booking this parking spot, you agree to our Terms of Service.',
              style: TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Book pressed');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text('Book for 20.8 MDL'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
