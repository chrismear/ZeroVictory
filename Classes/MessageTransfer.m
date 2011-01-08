#import "MessageTransfer.h"
#import "Swizzler.h"
#import "ZVInboxTracker.h"
#import <Cocoa/Cocoa.h>

@implementation XYZ_MessageTransfer

+ (void) load {
    [XYZ_Swizzler extendClass: @"MessageTransfer"
                    withClass: @"XYZ_MessageTransfer"];
}

- (void)XYZ_beginTransfer
{
    [self XYZ_beginTransfer];
    
    NSLog(@"MessageTransfer beginTransfer");
    
    [[ZVInboxTracker sharedInboxTracker] triggerInboxCheck];
}

@end
