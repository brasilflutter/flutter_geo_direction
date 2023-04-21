import '../enum/travel_mode_enum.dart';
import 'geo_way_point_dto.dart';
import 'point_lat_lng_dto.dart';

class GeoRequestDto {
  final String googleApiKey;
  final PointLatLngDto origin;
  final PointLatLngDto destination;
  final TravelModeEnum travelMode;
  final List<GeoWayPointDto> wayPoints;
  final bool avoidHighways;
  final bool avoidTolls;
  final bool avoidFerries;
  final bool optimizeWaypoints;
  GeoRequestDto({
    required this.googleApiKey,
    required this.origin,
    required this.destination,
    required this.travelMode,
    required this.wayPoints,
    required this.avoidHighways,
    required this.avoidTolls,
    required this.avoidFerries,
    required this.optimizeWaypoints,
  });
}
