#import <UIKit/UIKit.h>

#include "EsOrientation.h"

#define ORIENTATION_UNSPECIFIED 0
#define ORIENTATION_PORTRAIT 1
#define ORIENTATION_LANDSCAPE 2

// ----

@interface ForcedViewController : UIViewController

@property (nonatomic, assign) NSInteger requestedOrientation;

@end

// ----

@implementation ForcedViewController

- (NSUInteger) supportedInterfaceOrientations {
    if (self.requestedOrientation == ORIENTATION_PORTRAIT) {
        return UIInterfaceOrientationMaskPortrait;
    } else if (self.requestedOrientation == ORIENTATION_LANDSCAPE) {
        return UIInterfaceOrientationMaskLandscape;
    } else {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

@end

// ----

namespace EsOrientation {
    void recheckScreenOrientation(int screenOrientation) {
        UIViewController * rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];

        // https://github.com/gbenvenuti/cordova-plugin-screen-orientation/blob/master/src/ios/YoikScreenOrientation.m

        ForcedViewController *forcedViewController = [[ForcedViewController alloc] init];
        forcedViewController.requestedOrientation = screenOrientation;
        forcedViewController.view.backgroundColor = [UIColor clearColor];
        forcedViewController.view.opaque = YES;

        #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
        forcedViewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
        #endif

        dispatch_async(dispatch_get_main_queue(), ^{
            [rootViewController presentViewController:forcedViewController animated:NO completion:^{
                dispatch_after(0, dispatch_get_main_queue(), ^{
                    [rootViewController dismissViewControllerAnimated:NO completion:nil];
                });
            }];
        });
    }
}
