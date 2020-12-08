import 'package:geolocator/geolocator.dart';

class Location {
  //this should work
  double longtitude;
  double latitude;
  Location({this.longtitude, this.latitude});

  Future getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    longtitude = await position.longitude;
    latitude = await position.latitude;
  }
}
