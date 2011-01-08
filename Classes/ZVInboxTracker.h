#import <Cocoa/Cocoa.h>

static int lastInboxCount;

@interface ZVInboxTracker : NSObject {
}

+ (ZVInboxTracker *) sharedInboxTracker;
- (int) lastInboxCount;
- (void) setLastInboxCount:(int)newCount;
- (void) triggerInboxCheck;

@end
