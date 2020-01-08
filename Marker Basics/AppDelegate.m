#import "AppDelegate.h"
#import <KudanAR/ARAPIKey.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[ARAPIKey sharedInstance] setAPIKey:@"woaqx7oL/6rN8DgQGkd+F47mHvXjXvRcfdy/M5IqIGbXvTrzf1sazVkLHjD9jxutHh5usgByJhakOAvE5EI3omhwk+CYtySgx/3jKBy/d7/4OVvuh3+/umBtCb8qEd2Tuto0fkUNFU+e2Pem7I/JMqNyStBvB6u6KmSuuWlGMeAu7XWNlsLJyhn8iSdLlgXEJDnw+qJCYWmuZhVD48HHTsX20DcQFdhQQxvnnpqbGhXsRbn53z0hyrPE38p9snoFyTKMiNcB7iJh00sEF+Zq3O0I087EapTsk78g6hjCJcZjrDl8dnDRmm/Dk5aASDjkTfWFkOYO5LH0RGnHxCuaa3MhVb5ao3P5aArMwRuTVBh5ZZOHjBi8VjRqK+UN+hs0lk4GiRVfVph2+ejb4REoSouxSi9oiqeNlTzezuy8U4W93CSFyn5X4BHgmsL1nVq3YfS95jrMjhbk64FZYZ+9FidxoulaNEREaXgRQQo1LViZXI1ESLqTiQPGGQvQ9JBf+j2k1MBfhCX9SkEjug3q8Tn5c1oIk4ryDgGfaq1lexD71wI0Q5a9d+8vMg8gE3FKWrzm63M75kv8bIWvq3u18Pl23A2WaX6lwuNyeprGCHaD25V5s41uIm62kySrQjEfbLfKAxi3VPEVlUCpqlLZqGj6chDOTWYb9S76atUiFXE="];
    
    return YES;
}

@end
