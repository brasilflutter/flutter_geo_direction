
# GeoRouter
Um pacote Flutter que usa a API do Google Maps para obter rotas entre coordenadas geográficas. Ele retorna uma lista de pontos LatLng que pode ser usada para renderizar uma rota no Google Maps.

## Instalação
Adicione esta linha ao pubspec.yaml do seu projeto:
```
dependencies:
  geo_router: ^0.0.2
```
E rode o seguinte comando:
```
flutter pub get
```

## Screenshots

<center>
  <img src="https://github.com/viniciusoliverrs/flutter_geo_router/blob/main/screenshots/demo.png" width="200"/>
</center>


## Exemplo usando em conjunto com o google_maps_flutter 

```dart

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);
  @override
  void initState() {
    super.initState();
    getPolyPoints();
  }

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    final geoRouter = GeoRouter();
    final result = await geoRouter.getDirectionsBetweenCoordinates(
      request: GeoRequestDto(
        googleApiKey: "YOUR_API_KEY",
        origin: PointLatLngDto(
          latitude: sourceLocation.latitude,
          longitude: sourceLocation.longitude,
        ),
        destination: PointLatLngDto(
          latitude: destination.latitude,
          longitude: destination.longitude,
        ),
      ),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
          target: sourceLocation,
          zoom: 13.5,
        ),
        markers: {
          const Marker(
            markerId: MarkerId("source"),
            position: sourceLocation,
          ),
          const Marker(
            markerId: MarkerId("destination"),
            position: destination,
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: const Color(0xFF7B61FF),
            width: 6,
          ),
        },
      ),
    );
  }
}

```




## Autores
- [@viniciusoliverrs](https://github.com/viniciusoliverrs)

