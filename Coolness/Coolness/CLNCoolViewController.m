// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewController.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation CLNCoolViewController

- (void)addCell {
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    
    newCell.text = self.textField.text;
}

- (void)loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = UIColor.brownColor;
    
    CGRect accessoryRect;
    CGRect contentRect;
    CGRectDivide(UIScreen.mainScreen.bounds, &accessoryRect, &contentRect, 140, CGRectMinYEdge);
    
    UIView *accessoryView = [[UIView alloc] initWithFrame:accessoryRect];
    UIView *contentView = [[UIView alloc] initWithFrame:contentRect];
    
    self.contentView = contentView;
    
    contentView.clipsToBounds = YES;
    
    [self.view addSubview:accessoryView];
    [self.view addSubview:contentView];
    
    accessoryView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    contentView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    // Controls
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 85, 280, 40)];
    [accessoryView addSubview:self.textField];
    
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"Enter a label";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [accessoryView addSubview:button];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button sizeToFit];
    
    button.frame = CGRectOffset(button.frame, 310, 90);
    
    [button addTarget:self action:@selector(addCell) forControlEvents:UIControlEventTouchUpInside];
    
    // Cool View Cells
    
    CLNCoolViewCell *subview1 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(20, 60, 150, 40)];
    CLNCoolViewCell *subview2 = [[CLNCoolViewCell alloc] initWithFrame:CGRectMake(60, 120, 150, 40)];
    subview1.backgroundColor = UIColor.purpleColor;
    subview2.backgroundColor = UIColor.orangeColor;
    subview1.text = @"Hello World! 🌎🌍🌏";
    subview2.text = @"CoolViewCells Rock!!! 🏆🍾🍺";
    
    [subview1 sizeToFit];
    [subview2 sizeToFit];
    
    [contentView addSubview:subview1];
    [contentView addSubview:subview2];
}

@end
