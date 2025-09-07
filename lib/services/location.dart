import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('İzin reddedildi');
          return;
        }
      }

      Position? position = await Geolocator.getLastKnownPosition();
      // print(position);
      latitude = position!.latitude;
      longitude = position!.longitude;
    } catch (e) {
      print('Hata: $e');
    }
  }
}
