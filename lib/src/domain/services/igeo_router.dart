import '../../../geo_router.dart';

abstract class IGeoRouter {
  Future<GeoResponseDto> getDirectionsBetweenCoordinates({
    required GeoRequestDto request,
  });

  List<PointLatLngDto> decodePolyline(String encodedPoints);
}
