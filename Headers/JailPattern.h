#import <substrate.h>
#import <Foundation/Foundation.h>
// #define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface JailPattern: NSObject
- (BOOL)isPathRestricted: (NSString *)path;
- (BOOL)isURLRestricted: (NSURL *)url;
@end

// static JailPattern *JailPatternX = [JailPattern new];
static JailPattern *JailPatternX;