// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNAppDelegate.h"
#import "CLNCoolViewController.h"

@implementation CLNAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = UIColor.yellowColor;
    
    self.window.rootViewController = [[CLNCoolViewController alloc] init];
    
    [self.window makeKeyAndVisible];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = touches.anyObject;
//    CGPoint currLocation = [touch locationInView:nil];
//    CGPoint prevLocation = [touch previousLocationInView:nil];
//    CGFloat deltaX = currLocation.x - prevLocation.x;
//    CGFloat deltaY = currLocation.y - prevLocation.y;
//
//    CGPoint location = touch.view.center;
//    location.x += deltaX;
//    location.y += deltaY;
//    touch.view.center = location;
//}

@end
