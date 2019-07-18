// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@implementation CLNCoolViewController

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 100, 150, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(60, 160, 150, 40)];
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
    subview1.text = @"Hello World! 🌎🌍🌏";
    subview2.text = @"CoolViewCells Rock!!! 🏆🍾🍺";
    
    [subview1 sizeToFit];
    [subview2 sizeToFit];
    
    [self.view addSubview:subview1];
    [self.view addSubview:subview2];
}

@end
