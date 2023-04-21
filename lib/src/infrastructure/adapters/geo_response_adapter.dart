import '../../domain/dto/geo_response_dto.dart';
import '../../utils/helpers/decode_points_helper.dart';

class GeoResponseAdapter {
  static GeoResponseDto fromMap(Map<String, dynamic> map) {
    GeoResponseDto geoResponse = GeoResponseDto(
      points: [],
    );
    geoResponse = geoResponse.copyWith(status: map["status"]);
    if (map["status"]?.toLowerCase() == "ok" &&
        map["routes"] != null &&
        map["routes"].isNotEmpty) {
      geoResponse = geoResponse.copyWith(
        points: DecodePointsHelper.decodePolyline(
          map["routes"][0]["overview_polyline"]["points"],
        ),
      );
    } else {
      geoResponse = geoResponse.copyWith(
        errorMessage: map["error_message"] ?? "Unknown error",
      );
    }
    return geoResponse;
  }
}
