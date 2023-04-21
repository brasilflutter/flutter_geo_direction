class GeoWayPointDto {
  final String location;
  final bool stopOver;
  GeoWayPointDto({
    required this.location,
    this.stopOver = true,
  });
}
