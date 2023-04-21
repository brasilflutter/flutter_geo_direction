import '../../domain/dto/point_lat_lng_dto.dart';

class DecodePointsHelper {
  static List<PointLatLngDto> decodePolyline(String encoded) {
    List<PointLatLngDto> poly = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;

      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);

      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      PointLatLngDto p = PointLatLngDto(
        latitude: (lat / 1E5).toDouble(),
        longitude: (lng / 1E5).toDouble(),
      );

      poly.add(p);
    }

    return poly;
  }
}
