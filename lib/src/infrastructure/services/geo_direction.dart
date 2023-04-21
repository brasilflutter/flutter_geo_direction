import 'dart:convert';

import '../../domain/dto/geo_request_dto.dart';
import '../../domain/dto/geo_response_dto.dart';
import '../../domain/dto/point_lat_lng_dto.dart';
import '../../domain/services/igeo_router.dart';
import '../../utils/helpers/decode_points_helper.dart';
import '../../utils/helpers/http_helper.dart';
import '../adapters/geo_request_adapter.dart';
import '../adapters/geo_response_adapter.dart';

class GeoDirection implements IGeoRouter {
  @override
  Future<GeoResponseDto> getDirectionsBetweenCoordinates({
    required GeoRequestDto request,
  }) async {
    try {
      final response = await HttpHelper.get(
        url: 'maps.googleapis.com',
        endpoint: '/maps/api/directions/json',
        params: GeoRequestAdapter.toMap(request),
      );
      if (response.statusCode == 200) {
        final parsedJson = json.decode(response.body);
        return GeoResponseAdapter.fromMap(parsedJson);
      } else {
        return GeoResponseDto(
          status: response.statusCode.toString(),
          errorMessage: 'Error ${response.statusCode}',
          points: [],
        );
      }
    } catch (e) {
      return GeoResponseDto(
        status: '500',
        errorMessage: e.toString(),
        points: [],
      );
    }
  }

  @override
  List<PointLatLngDto> decodePolyline(String encodedPoints) {
    try {
      return DecodePointsHelper.decodePolyline(encodedPoints);
    } catch (e) {
      return [];
    }
  }
}
