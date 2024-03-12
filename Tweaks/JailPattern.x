#import "../Headers/JailPattern.h"

@implementation JailPattern
-(BOOL) isPathRestricted: (NSString*) path {
	if([path hasPrefix:@"/tmp"] || [path hasPrefix:@"/var/tmp"])
		return YES;

	NSArray *jailbreakFiles = [NSArray arrayWithObjects:
                                @"/Applications/Cydia.app",
                                @"/Applications/Sileo.app",
                                @"/Library/MobileSubstrate/MobileSubstrate.dylib",
                                @"/bin/bash",
                                @"/usr/sbin/sshd",
                                @"/etc/apt",
                                @"/private/var/lib/apt/",
	                           nil
	                          ];

	for (NSString *jbFile in jailbreakFiles) {
		if ([path isEqualToString:jbFile]) {
			return YES;
		}
	}
	NSLog(@"[Tweak] file = %@", path);
	return NO;
}

-(BOOL) isURLRestricted: (NSURL *) url {
	NSArray *jailbreakURLSchemes = [NSArray arrayWithObjects:
	                                @"cydia",
	                                nil
	                               ];

	for (NSString *jbURL in jailbreakURLSchemes) {
		if ([[url absoluteString] hasPrefix:jbURL])
			return YES;
	}
	return NO;
}
@end