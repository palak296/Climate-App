import 'package:location/location.dart';

class LocationClass {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Location location = Location();
      LocationData locationData;
      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;
    } catch (e) {
      print(e);
    }
  }
}