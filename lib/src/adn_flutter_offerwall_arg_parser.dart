import 'dart:ffi';

import 'adn_flutter_offerwall_constants.dart';

class OfferWallArgParser {
  static Map<String, dynamic> showOfferWall(String title) {
    return {OfferConstKey.TITLE: title};
  }

  static Map<String, dynamic> setUserId(String userId) {
    return {OfferConstKey.USER_ID: userId};
  }

  static Map<String, dynamic> setGender(String gender) {
    return {OfferConstKey.GENDER: gender};
  }

  static Map<String, dynamic> setBirthYear(int birthYear) {
    return {OfferConstKey.BIRTHYEAR: birthYear};
  }

  static Map<String, dynamic> init(String appKey) {
    return {OfferConstKey.APP_KEY: appKey};
  }
}
