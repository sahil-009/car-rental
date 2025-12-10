// Simple Car model class
class Car {
  final String name;
  final int price;
  final String fuel;
  final int seats;
  final bool available;

  Car({
    required this.name,
    required this.price,
    required this.fuel,
    required this.seats,
    this.available = true,
  });
}
