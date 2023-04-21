import 'package:flutter_test/flutter_test.dart';
import 'package:geo_direction/geo_direction.dart';

Future<void> main() async {
  test('adds one to input values', () async {
    final service = GeoDirection();
    final origin = PointLatLngDto(
      latitude: 37.33500926,
      longitude: -122.03272188,
    );
    final destination = PointLatLngDto(
      latitude: 37.33429383,
      longitude: -122.06600055,
    );
    final response = await service.getDirectionsBetweenCoordinates(
      request: GeoRequestDto(
        googleApiKey: "YOUR_API_KEY",
        origin: origin,
        destination: destination,
      ),
    );
    expect(response, isA<GeoResponseDto>());
  });
}
