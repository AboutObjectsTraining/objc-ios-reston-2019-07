// Copyright (C) 2019 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "CLNCoolViewCell.h"

UIEdgeInsets CLNTextInsets = {
    .top = 7,
    .left = 12,
    .right = 12,
    .bottom = 8
};

@interface CLNCoolViewCell ()
@property (nonatomic, getter=isHighlighted) BOOL highlighted;
@property (nonatomic, class, readonly) NSDictionary *textAttributes;
@end

@implementation CLNCoolViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (!(self = [super initWithFrame:frame])) return nil;
    
    [self configureLayer];
    [self configureGestureRecognizers];
    
    return self;
}

- (void)configureGestureRecognizers {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bounce)];
    recognizer.numberOfTapsRequired = 2;
    [self addGestureRecognizer:recognizer];
}

- (void)configureLayer {
    self.layer.borderWidth = 3;
    self.layer.borderColor = UIColor.whiteColor.CGColor;
    self.layer.cornerRadius = 8;
    self.layer.masksToBounds = YES;
}


// #warning We should be overriding initWithCoder:
// FIXME: Override initWithCoder: once we start using IB

+ (NSDictionary *)textAttributes {
    return @{ NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
              NSForegroundColorAttributeName : UIColor.whiteColor };
}

- (void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    self.alpha = highlighted ? 0.5 : 1.0;
}


// MARK: - Animation

- (void)bounce {
    NSLog(@"In %s", __func__);
    [self animateBounceWithDuration:1 size:CGSizeMake(120, 240)];
}

// FIXME: Switch to block literal-based API
- (void)animateBounceWithDuration:(NSTimeInterval)duration size:(CGSize)size {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationRepeatCount:3.5];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    CGAffineTransform translation = CGAffineTransformMakeTranslation(size.width, size.height);
    self.transform = CGAffineTransformRotate(translation, M_PI_2);
    
    [UIView commitAnimations];
    
    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(animateFinalBounce:) userInfo:@(duration) repeats:NO];
}

- (void)animateFinalBounce:(NSTimer *)timer {
    NSNumber *duration = timer.userInfo;
    NSLog(@"In %s, duration is %.1f", __func__, duration.floatValue);
    [self animateFinalBounceWithDuration:duration.floatValue];
}

- (void)animateFinalBounceWithDuration:(NSTimeInterval)duration {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:duration];
    
    self.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
}

// MARK: - Drawing and resizing

- (void)drawRect:(CGRect)rect {
    [self.text drawAtPoint:CGPointMake(CLNTextInsets.left, CLNTextInsets.top) withAttributes:self.class.textAttributes];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize newSize = [self.text sizeWithAttributes:self.class.textAttributes];
    newSize.width += CLNTextInsets.left + CLNTextInsets.right;
    newSize.height += CLNTextInsets.top + CLNTextInsets.bottom;
    return newSize;
}


// MARK: - UIResponder methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    self.highlighted = YES;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint currLocation = [touch locationInView:nil];
    CGPoint prevLocation = [touch previousLocationInView:nil];
    CGFloat deltaX = currLocation.x - prevLocation.x;
    CGFloat deltaY = currLocation.y - prevLocation.y;
    
    CGPoint location = self.center;
    location.x += deltaX;
    location.y += deltaY;
    self.center = location;
}

- (void)endTouch {
    self.highlighted = NO;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endTouch];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endTouch];
}

@end
