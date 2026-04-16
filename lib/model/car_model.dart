class CarModel {
  final String imagePath;
  final String brandName;
  final String year;
  final String location;
  final String? description;
  final double price;
  final String? brandLogo;
  final String? transmission;
  final String? bodyType;
  final String? highway;
  final String? engine;
  final String? exteriorColor;
  final String? fuelType;

  CarModel({
    required this.imagePath,
    required this.brandName,
    required this.year,
    required this.location,
    this.description,
    required this.price,
    this.brandLogo,
    this.transmission,
    this.bodyType,
    this.highway,
    this.engine,
    this.exteriorColor,
    this.fuelType,
  });
}
