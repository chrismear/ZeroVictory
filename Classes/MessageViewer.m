#import "MessageViewer.h"
#import "Swizzler.h"


@implementation XYZ_MessageViewer

+ (void) load {
    [XYZ_Swizzler extendClass: @"MessageViewer"
                    withClass: @"XYZ_MessageViewer"];
}

- (void) XYZ_showComposeWindow: (id) arg1 {
    [self XYZ_showComposeWindow: arg1];
    NSLog(@"Swizzled");
}

@end
