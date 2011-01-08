#import "ActivityViewerMailSound.h"
#import "ZVInboxTracker.h"
#import "Swizzler.h"


@implementation XYZ_ActivityViewerMailSound

+ (void) load {
    [XYZ_Swizzler extendClass: @"ActivityViewerMailSound"
                    withClass: @"XYZ_ActivityViewerMailSound"];
}

- (void)XYZ_beginFetch:(BOOL)arg1
{
    [self XYZ_beginFetch:arg1];
    
    NSLog(@"ActivityViewerMailSound beginFetch");
    
    [[ZVInboxTracker sharedInboxTracker] triggerInboxCheck];
}



@end
