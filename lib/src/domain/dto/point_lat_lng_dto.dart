class PointLatLngDto {
  final double latitude;
  final double longitude;
  
  PointLatLngDto({
    required this.latitude,
    required this.longitude,
  });

  PointLatLngDto copyWith({
    double? latitude,
    double? longitude,
  }) {
    return PointLatLngDto(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
