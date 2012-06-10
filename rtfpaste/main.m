//
//  main.m
//  rtfpaste
//
//  Created by Bob Warwick on 12-06-09.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
                
        NSArray *attributedStrings = [[NSPasteboard generalPasteboard] readObjectsForClasses:[NSArray arrayWithObject:[NSAttributedString class]] options:nil];
        if ([attributedStrings count] == 0) {
            NSLog(@"Error reading attributed string");
            return 1;
        }
        
        NSAttributedString *attributed = [attributedStrings objectAtIndex:0];
        NSData *rtfData = [attributed RTFFromRange:NSMakeRange(0, [attributed length]) documentAttributes:nil];
        printf("%s", [[[NSString alloc] initWithData:rtfData encoding:NSASCIIStringEncoding] UTF8String]);
        
    }
    return 0;
}

