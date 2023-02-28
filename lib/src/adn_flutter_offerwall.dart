import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'adn_flutter_offerwall_constants.dart';
import 'adn_flutter_offerwall_arg_parser.dart';

class OfferWall {
  static final MethodChannel _channel =
      const MethodChannel(OfferConst.METHOD_CHANNEL)
        ..setMethodCallHandler(handleMethodCall);
  static String? userId;

  static String getPluginVersion() {
    return OfferConst.PLUGIN_VERSION;
  }

  static String getNativeSDKVersion(String platform) {
    return platform == 'android'
        ? OfferConst.ANDROID_SDK_VERSION
        : platform == 'ios'
            ? OfferConst.IOS_SDK_VERSION
            : '';
  }

  static Future<void> init({required String appKey}) async {
    final args = OfferWallArgParser.init(appKey);
    return _channel.invokeMethod('init', args);
  }

  static Future<void> setUserId({required String userId}) async {
    final args = OfferWallArgParser.setUserId(userId);
    return _channel.invokeMethod('setUserId', args);
  }

  static Future<void> setGender({required String gender}) async {
    final args = OfferWallArgParser.setGender(gender);
    return _channel.invokeMethod('setGender', args);
  }

  static Future<void> setBirthYear({required int birthYear}) async {
    final args = OfferWallArgParser.setBirthYear(birthYear);
    return _channel.invokeMethod('setBirthYear', args);
  }

  static Future<void> showOfferWall({required String title}) async {
    final args = OfferWallArgParser.showOfferWall(title);
    return _channel.invokeMethod('showOfferWall', args);
  }

  @visibleForTesting
  static Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      default:
        throw UnimplementedError("Method not implemented: ${call.method}");
    }
  }
}
