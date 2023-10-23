import 'package:url_launcher/url_launcher.dart';

class PhoneHelper {

  Future<void> openPhoneDealer(String number) async {
    Uri url = Uri.parse("tel:$number>");
    if (!await launchUrl(url)) {
      throw 'Could not launch url';
    }
  }

}