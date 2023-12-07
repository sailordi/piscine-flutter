#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import 'GoogleMaps'

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    [GMSServices provideAPIKey:@"YOUR KEY HERE"];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
