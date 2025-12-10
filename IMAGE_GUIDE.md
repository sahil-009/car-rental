# Adding Car Images to Your App

Since you mentioned you'll be adding images, here's a simple guide on how to add them:

## Step 1: Prepare Your Images

1. Get car images (preferably 800x600 or similar aspect ratio)
2. Name them simply:
   - `honda_city.jpg`
   - `maruti_swift.jpg`
   - `hyundai_creta.jpg`
   - `toyota_innova.jpg`
   - `mahindra_thar.jpg`
   - `tata_nexon.jpg`

## Step 2: Add to Assets Folder

Place all images in: `assets/images/`

## Step 3: Update Car Model (Optional)

If you want to use the images, you can add an `image` field to the Car model:

```dart
class Car {
  final String name;
  final int price;
  final String fuel;
  final int seats;
  final bool available;
  final String? image; // Add this line

  Car({
    required this.name,
    required this.price,
    required this.fuel,
    required this.seats,
    this.available = true,
    this.image, // Add this line
  });
}
```

## Step 4: Update Mock Data

Add image paths to mock cars:

```dart
Car(
  name: 'Honda City',
  price: 1200,
  fuel: 'Petrol',
  seats: 5,
  available: true,
  image: 'assets/images/honda_city.jpg', // Add this
),
```

## Step 5: Display Images

Replace the placeholder in `car_details_screen.dart`:

```dart
// Replace this:
Container(
  height: 180,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(8),
  ),
  child: const Center(child: Icon(Icons.directions_car, size: 80, color: Colors.grey)),
),

// With this:
Container(
  height: 180,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  ),
  child: car.image != null
      ? ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            car.image!,
            fit: BoxFit.cover,
          ),
        )
      : Container(
          color: Colors.grey.shade200,
          child: const Center(
            child: Icon(Icons.directions_car, size: 80, color: Colors.grey),
          ),
        ),
),
```

That's it! Run `flutter pub get` again after adding images, then `flutter run` to see them in your app.
