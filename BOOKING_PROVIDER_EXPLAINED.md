# Understanding booking_provider.dart

## What is it?

The `booking_provider.dart` file is like a **shared notebook** that all screens in your app can read and write to.

## Simple Analogy

Think of it like this:
- You're booking a hotel room
- The booking provider is like a form you carry from desk to desk
- Each desk (screen) adds more info to the form
- At the end, you have all the information in one place

## How It Works (Step by Step)

### Step 1: You select a car
```dart
// Car List Screen says: "User picked Honda City"
ref.read(bookingProvider.notifier).selectCar(car);
```
**Provider saves:** Car = Honda City

### Step 2: Car Details Screen
```dart
// Car Details reads: "What car did user pick?"
final car = ref.watch(bookingProvider).car;
// Answer: Honda City
```

### Step 3: Booking Form
```dart
// User fills: Name = "John", Dates = "Jan 1 - Jan 5", Location = "Mumbai"
ref.read(bookingProvider.notifier).confirmBooking(
  name: "John",
  start: Jan1,
  end: Jan5,
  location: "Mumbai"
);
```
**Provider now has:** Car + Name + Dates + Location

### Step 4: Confirmation Screen
```dart
// Confirmation reads everything
final booking = ref.watch(bookingProvider);
// Shows: Honda City, John, Jan 1-5, Mumbai, Total: ₹6000
```

## The Code Structure

### BookingState (The Box)
```dart
class BookingState {
  final Car? car;          // Which car?
  final String? name;      // Customer name?
  final DateTime? start;   // Start date?
  final DateTime? end;     // End date?
  final String? location;  // Pickup location?
}
```
This is the "box" that holds all the information.

### BookingNotifier (The Box Manager)
```dart
class BookingNotifier extends StateNotifier<BookingState> {
  // Put a car in the box
  void selectCar(Car car) {
    state = state.copyWith(car: car);
  }

  // Add booking details to the box
  void confirmBooking({name, start, end, location}) {
    state = state.copyWith(
      name: name,
      start: start,
      end: end,
      location: location,
    );
  }
}
```
This is the "manager" that puts things in and takes things out of the box.

### The Provider (Makes it Available Everywhere)
```dart
final bookingProvider = StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  return BookingNotifier();
});
```
This makes the box available to ALL screens in the app.

## Why Use It?

Without Provider:
```
Screen 1 → Screen 2 → Screen 3 → Screen 4
  ↓          ↓          ↓          ↓
 Pass      Pass       Pass      Pass
 data →    data →     data →    data
```
You have to manually pass data through every screen!

With Provider:
```
Screen 1 → Write to Provider
Screen 2 → Read from Provider
Screen 3 → Read from Provider
Screen 4 → Read from Provider
```
Any screen can read/write directly!

## Car Availability Feature

### What Changed:

1. **Some cars are now unavailable**
   - Hyundai Creta: available = false
   - Mahindra Thar: available = false

2. **Check before booking**
   ```dart
   if (!car.available) {
     // Show red message: "Sorry, Honda City is not available"
     return;
   }
   ```

3. **Visual indicator**
   - Available cars: Normal display
   - Unavailable cars: Red "Not Available" badge

### Try It:
1. Open car list
2. See "Not Available" badge on Hyundai Creta and Mahindra Thar
3. Try to click on them
4. You'll see a red message: "Sorry, [car name] is not available"
5. It won't let you book them!

---

**Simple Summary:** The booking provider is a shared storage that remembers your car selection and booking details as you move between screens, making it easy to pass data around without manually sending it through every screen!
