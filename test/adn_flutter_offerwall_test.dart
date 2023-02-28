import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adn_flutter_offerwall/adn_flutter_offerwall_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('adn_flutter_offerwall');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
