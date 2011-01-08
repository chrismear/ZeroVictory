#import "ZVInboxTracker.h"

static ZVInboxTracker *sharedInboxTracker;
static NSSound *victorySound;

@implementation ZVInboxTracker

- (id) init
{
    if ((self = [super init])) {
        NSBundle *zvBundle = [NSBundle bundleWithIdentifier:@"com.feedmechocolate.ZeroVictory"];
        victorySound = [[NSSound alloc] initWithContentsOfFile:[zvBundle pathForResource:@"ffvictory" ofType:@"wav"] byReference:YES];
    }
    return self;
}

- (void) dealloc
{
    [victorySound release];
    [super dealloc];
}

- (int) lastInboxCount
{
    return lastInboxCount;
}

- (void)setLastInboxCount:(int)newCount
{
    lastInboxCount = newCount;
}

- (void) doInboxCheck
{
    id mailApp = [NSApplication sharedApplication];
    int newCount = [[[mailApp inbox] messages] count];
    NSLog(@"newCount: %i", newCount);
    NSLog(@"lastCount: %i", [sharedInboxTracker lastInboxCount]);
    if ((newCount != [sharedInboxTracker lastInboxCount]) && (newCount == 0)) {
        NSLog(@"INBOX ZERO!");
        if (![victorySound isPlaying]) {
            NSLog(@"Playing victory sound");
            [victorySound play];
        }
    }
    [sharedInboxTracker setLastInboxCount:newCount];
}

- (void) triggerInboxCheck
{
    [self performSelector:@selector(doInboxCheck)
               withObject:nil
               afterDelay:5.0];
}


+ (ZVInboxTracker *) sharedInboxTracker
{
    @synchronized(self) {
        if (sharedInboxTracker == nil) {
            [[self alloc] init];
        }
    }
    return sharedInboxTracker;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedInboxTracker == nil) {
            sharedInboxTracker = [super allocWithZone:zone];
            return sharedInboxTracker;
        }
    }
    return nil;
}

- (id) copyWithZone:(NSZone *)zone
{
    return self;
}

- (id) retain
{
    return self;
}

- (unsigned) retainCount
{
    return UINT_MAX;
}

- (void) release
{
    // Do nothing.
}

- (id) autorelease
{
    return self;
}

@end
