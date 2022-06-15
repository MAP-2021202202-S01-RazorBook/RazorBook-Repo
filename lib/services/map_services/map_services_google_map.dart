import 'package:razor_book/services/map_services/maps_services.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMap implements MapServices {

  @override
  Future<void> openLocationOnMap(String url) async {

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not open the map.';
    }
  }
}
