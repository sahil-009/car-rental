import '../models/car.dart';

// Mock data for cars - no backend needed
final List<Car> mockCars = [
  Car(
    name: 'Honda City',
    price: 1200,
    fuel: 'Petrol',
    seats: 5,
    available: true,  // Available
  ),
  Car(
    name: 'Fortuner',
    price: 800,
    fuel: 'Petrol',
    seats: 5,
    available: true,  // Available
  ),
  Car(
    name: 'Hyundai Creta',
    price: 1800,
    fuel: 'Diesel',
    seats: 5,
    available: false,  // NOT Available
  ),
  Car(
    name: 'Toyota Innova',
    price: 2500,
    fuel: 'Diesel',
    seats: 7,
    available: true,  // Available
  ),
  Car(
    name: 'Mahindra Thar',
    price: 3000,
    fuel: 'Diesel',
    seats: 4,
    available: false,  // NOT Available
  ),
  Car(
    name: 'Tata Nexon',
    price: 1500,
    fuel: 'Petrol',
    seats: 5,
    available: true,  // Available
  ),
];
