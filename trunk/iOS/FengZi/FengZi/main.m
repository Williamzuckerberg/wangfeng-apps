//
//  main.m
//  FengZi
//
//  Created by  on 11-12-25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FZAppDelegate.h"

int main(int argc, char *argv[])
{
    /*
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([FZAppDelegate class]));
    }
     */
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([FZAppDelegate class]));
    [pool release];
    return retVal;
}
