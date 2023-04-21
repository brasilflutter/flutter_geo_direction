import 'point_lat_lng_dto.dart';

class GeoResponseDto {
  final String? status;
  final List<PointLatLngDto> points;
  final String? errorMessage;
  GeoResponseDto({
    this.status,
    required this.points,
    this.errorMessage,
  });

  GeoResponseDto copyWith({
    String? status,
    List<PointLatLngDto>? points,
    String? errorMessage,
  }) {
    return GeoResponseDto(
      status: status ?? this.status,
      points: points ?? this.points,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
