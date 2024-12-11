class Planet {
  final int position;
  final String name;
  final String image;
  final double velocity;
  final double distance;
  final String description;

  Planet({
    required this.position,
    required this.name,
    required this.image,
    required this.velocity,
    required this.distance,
    required this.description,
  });

  // Factory constructor for creating a Planet instance from a JSON map
  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      position: int.parse(json['position']),
      name: json['name'],
      image: json['image'],
      velocity: double.parse(json['velocity']),
      distance: double.parse(json['distance']),
      description: json['description'],
    );
  }

  // Method to convert a Planet instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'position': position.toString(),
      'name': name,
      'image': image,
      'velocity': velocity.toString(),
      'distance': distance.toString(),
      'description': description,
    };
  }
}
