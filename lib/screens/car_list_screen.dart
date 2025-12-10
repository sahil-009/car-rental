import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_cars.dart';
import '../providers/booking_provider.dart';
import 'car_details_screen.dart';

class CarListScreen extends ConsumerWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Available Cars', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mockCars.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final car = mockCars[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                // Check if car is available
                if (!car.available) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Sorry, ${car.name} is not available'),
                      backgroundColor: Colors.red.shade600,
                    ),
                  );
                  return;
                }
                
                // Save car and go to details screen
                ref.read(bookingProvider.notifier).saveCar(car);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CarDetailsScreen()),
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Car image placeholder i have no tt added images -
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.directions_car, size: 40, color: Colors.grey),
                    ),
                    
                    const SizedBox(width: 16),
                    
                    // Car info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  car.name,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Show badge if not available
                              if (!car.available)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Not Available',
                                    style: TextStyle(fontSize: 10, color: Colors.red.shade700, fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.local_gas_station, size: 14, color: Colors.grey.shade600),
                              const SizedBox(width: 4),
                              Text(car.fuel, style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                              const SizedBox(width: 12),
                              Icon(Icons.event_seat, size: 14, color: Colors.grey.shade600),
                              const SizedBox(width: 4),
                              Text('${car.seats} Seats', style: TextStyle(fontSize: 13, color: Colors.grey.shade600)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '₹${car.price}/day',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade700),
                          ),
                        ],
                      ),
                    ),
                    
                    // Arrow icon
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
