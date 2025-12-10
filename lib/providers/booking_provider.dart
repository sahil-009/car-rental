import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/car.dart';

//  Simple class to store booking info when user selct the 
//  car and go to next screen
class BookingData {
  Car? selectedCar;
  String? customerName;
  DateTime? startDate;
  DateTime? endDate;
  String? pickupLocation;

  BookingData({
    this.selectedCar,
    this.customerName,
    this.startDate,
    this.endDate,
    this.pickupLocation,
  });
}

// Manages the booking data
class BookingManager extends StateNotifier<BookingData> {
  BookingManager() : super(BookingData());

  // Save selected car
  void saveCar(Car car) {
    state.selectedCar = car;
    state = BookingData(
      selectedCar: state.selectedCar,
      customerName: state.customerName,
      startDate: state.startDate,
      endDate: state.endDate,
      pickupLocation: state.pickupLocation,
    );
  }

  // Save booking details
  void saveBooking(String name, DateTime start, DateTime end, String location) {
    state.customerName = name;
    state.startDate = start;
    state.endDate = end;
    state.pickupLocation = location;
    state = BookingData(
      selectedCar: state.selectedCar,
      customerName: state.customerName,
      startDate: state.startDate,
      endDate: state.endDate,
      pickupLocation: state.pickupLocation,
    );
  }

  // Clear all data
  void clearAll() {
    state = BookingData();
  }
}

// Provider to use in screens
final bookingProvider = StateNotifierProvider<BookingManager, BookingData>((ref) {
  return BookingManager();
});
