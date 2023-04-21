import '../../domain/dto/geo_request_dto.dart';

class GeoRequestAdapter {
  static Map<String, dynamic> toMap(GeoRequestDto dto) {
    final map = {
      "origin": "${dto.origin.latitude},${dto.origin.longitude}",
      "destination": "${dto.destination.latitude},${dto.destination.longitude}",
      "mode": dto.travelMode.toString().replaceAll('TravelMode.', ''),
      "avoidHighways": "${dto.avoidHighways}",
      "avoidFerries": "${dto.avoidFerries}",
      "avoidTolls": "${dto.avoidTolls}",
      "key": dto.googleApiKey,
    };
    if (dto.wayPoints.isNotEmpty) {
      List wayPointsArray = [];
      for (var point in dto.wayPoints) {
        wayPointsArray.add(point.location);
      }
      String wayPointsString = wayPointsArray.join('|');
      if (dto.optimizeWaypoints) {
        wayPointsString = 'optimize:true|$wayPointsString';
      }
      map.addAll({"waypoints": wayPointsString});
    }
    return map;
  }
}
