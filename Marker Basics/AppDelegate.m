#import "AppDelegate.h"
#import <KudanAR/ARAPIKey.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[ARAPIKey sharedInstance] setAPIKey:@"x5twkAEPQXupAlIDv3PurcSOwnr9c3940VLf2e711EDe5r9kfk2CpvWSX2qAepXDGRNIU1SNHWZZZh3bMfH1s5iw9DQxI5Q4Si4n5V+eIlH6a8U9KVWs3bzRCPVxKJZuiBjRXnqymQYJ9RM6t6WZFlrWa69U2OuOp6gwAwGW3YniNA/FbQOkXR0mepIbIIwY3Eps05445ILiBuBWtp2+VlXA/GWg9BXCGptgcdbScLbXvTky6OijvhKqlJOOoa7yFL1Sn2234PSnlO9CNt+soj2ZSCrxN4JvcOVnjjXsmDpCXpGf8dHf7feQQIAyYiHNGX5rqNsA6WbSu+yf7NKPgZgx8Cxha7GC35d2vjzZA3daOYA+Kpzwtt3PzEHuiwdyskpRs0ULWb9Jp2UyHZPRqr1g1q3e07qK0HkGsb1yQZmaXOXcrcvgfbVVThaCxKFbKRBv8XWI2sF912XpsidAYE0R/RE40D+Mup3FotSx507ydA0U2frWdyT9nwxsCEUFF9dhAjUAHaf/tG+eaRu0nP7f4AiQfnam914uNCw7YVYzF8Gi4ekEDU2zTalGhVo5iyUSqdNsJ5W7VLwKSs76HaeMVVSEwpMnrrIw6ebjmoUPscbg6toZnOpe2YS+UvsXPNjrMD8col9EzkrJZ4dT321n9SesWtIY9Bw2UlvHlvI="];
    
    return YES;
}

@end
