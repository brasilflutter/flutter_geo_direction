import '../../../geo_direction.dart';

abstract class IGeoRouter {
  Future<GeoResponseDto> getDirectionsBetweenCoordinates({
    required GeoRequestDto request,
  });

  List<PointLatLngDto> decodePolyline(String encodedPoints);
}
