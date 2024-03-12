#import "../Headers/ObjCHooks.h"
#import "../Headers/JailPattern.h"

%group ObjCHooks
%hook UIApplication
- (BOOL)canOpenURL: (NSURL *)url {
	if([JailPatternX isURLRestricted:url]) {
		NSLog(@"[Tweak] BYPASSED URL = %@", url);
		return NO;
	}
	return %orig;
}
%end

%hook NSFileManager
- (BOOL)fileExistsAtPath: (NSString *)path {
	if([JailPatternX isPathRestricted:path])
	{
		NSLog(@"[Tweak] BYPASSED file = %@", path);
		return NO;
	}
	return %orig;
}

- (BOOL)isWritableFileAtPath: (NSString *)path {
	// if([path isEqualToString:@"/private/"]) {
	if([path isEqualToString:@"/private/JailbreakTest.txt"]) {
		NSLog(@"[Tweak] BYPASSED write = %@", path);
		return NO;
	}
	else {
		return %orig;
	}
}
%end
%end

void loadObjCHooks() {
	JailPatternX = [JailPattern new];
	%init(ObjCHooks);
}