import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/booking_provider.dart';

class ConfirmationScreen extends ConsumerWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booking = ref.watch(bookingProvider);

    // Check if booking exists
    if (booking.selectedCar == null) {
      return const Scaffold(body: Center(child: Text('No booking found.')));
    }

    final car = booking.selectedCar!;
    
    // Calculate days and total cost
    final days = booking.startDate != null && booking.endDate != null
        ? booking.endDate!.difference(booking.startDate!).inDays + 1
        : 1;
    final totalCost = days * car.price;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox(),
        title: const Text('Booking Confirmed', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    
                    // Success icon
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.check_circle, color: Colors.green.shade600, size: 60),
                    ),
                    
                    const SizedBox(height: 24),
                    const Text('Booking Successful!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Your car has been booked', style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                    
                    const SizedBox(height: 40),
                    
                    // Booking details card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          buildDetailRow('Car', car.name),
                          const Divider(height: 24),
                          buildDetailRow('Name', booking.customerName ?? '-'),
                          const Divider(height: 24),
                          buildDetailRow('Pickup Location', booking.pickupLocation ?? '-'),
                          const Divider(height: 24),
                          buildDetailRow('Start Date', booking.startDate.toString().split(' ').first),
                          const Divider(height: 24),
                          buildDetailRow('End Date', booking.endDate.toString().split(' ').first),
                          const Divider(height: 24),
                          buildDetailRow('Duration', '$days days'),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Total cost box
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                          Text(
                            '₹$totalCost',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Done button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(0, -4))],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/cars', (_) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Done', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for detail row
  Widget buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
