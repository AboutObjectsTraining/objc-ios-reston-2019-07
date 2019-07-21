// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolView.h"
#import "CLNCoolViewCell.h"

@interface CLNCoolView ()  <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UIView *contentView;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@end

@implementation CLNCoolView

- (IBAction)addCell {
    [self addCellWithColor:UIColor.brownColor];
}

- (void)addCellWithColor:(UIColor *)color {
    CLNCoolViewCell *newCell = [[CLNCoolViewCell alloc] init];
    [self.contentView addSubview:newCell];
    
    newCell.text = self.textField.text;
    newCell.backgroundColor = color;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
