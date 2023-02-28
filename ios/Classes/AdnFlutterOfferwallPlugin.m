#import "AdnFlutterOfferwallPlugin.h"
#if __has_include(<adn_flutter_offerwall/adn_flutter_offerwall-Swift.h>)
#import <adn_flutter_offerwall/adn_flutter_offerwall-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "adn_flutter_offerwall-Swift.h"
#endif

@implementation AdnFlutterOfferwallPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdnFlutterOfferwallPlugin registerWithRegistrar:registrar];
}
@end
