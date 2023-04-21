import '../dto/geo_response_dto.dart';
import '../dto/geo_way_point_dto.dart';
import '../dto/point_lat_lng_dto.dart';
import '../enum/travel_mode_enum.dart';

abstract class IGeoRouter {
  Future<GeoResponseDto> getDirectionsBetweenCoordinates({
    required String apiKeyGoogleMaps,
    required PointLatLngDto origen,
    required PointLatLngDto destination,
    TravelModeEnum travelMode = TravelModeEnum.driving,
    List<GeoWayPointDto> wayPoints = const [],
    bool avoidHighways = false,
    bool avoidTolls = false,
    bool avoidFerries = true,
    bool optimizeWaypoints = false,
  });

  List<PointLatLngDto> decodePolyline(String encodedPoints);
}
