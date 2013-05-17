//
//  KoaCustomNavBar.m
//  KoaCustomNavBar
//
//  Created by Sergi Gracia on 13/05/13.
//  Copyright (c) 2013 Sergi Gracia. All rights reserved.
//

#import "KoaCustomNavBar.h"
#import "NSString+FontAwesome.h"
#import "UIFont+FontAwesome.h"

#define kTitleVerticalMargin 5
#define kMinimumWithButtonsMargin 200

@implementation KoaCustomNavBar

#pragma mark - Inits

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}


- (id)init
{
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit
{
    NSLog(@"Init navBar!!!");

    if (!self.gradientColor1) {
        self.gradientColor1 = [UIColor colorWithRed:0.498 green:0.498 blue:0.498 alpha:1];
    }

    if (!self.gradientColor2) {
        self.gradientColor2 = [UIColor colorWithRed:0.231 green:0.231 blue:0.231 alpha:1];
    }
    
    if (!self.titleFont) {
        self.titleFont = [UIFont fontWithName:@"Helvetica" size:16];
    }

    if (!self.buttonsFont) {
        self.buttonsFont = [UIFont fontWithName:@"Helvetica" size:16];
    }
    
    if (self.titleMinimumFontSize == 0) {
        self.titleMinimumFontSize = 10;
    }
    
    if (self.buttonsFontAwesomeIconsSize == 0) {
        self.buttonsFontAwesomeIconsSize = 28;
    }
    
    [self setTitleTextFont:self.titleFont];
    [self setButtonsTextFont:self.buttonsFont];
}

#pragma mark - Setters

- (void)setTitle:(NSString *)title
{
    self.topItem.titleView = nil;
    
    int leftButtonWidth = kMinimumWithButtonsMargin;
    int rightButtonWidth = kMinimumWithButtonsMargin;
    
    if ([self.topItem.leftBarButtonItems objectAtIndex:1]) {
        if ([[self.topItem.leftBarButtonItems objectAtIndex:1] isKindOfClass:[UIBarButtonItem class]]) {
            leftButtonWidth = ((UIBarButtonItem *)[self.topItem.leftBarButtonItems objectAtIndex:1]).customView.frame.size.width;
        }
    }
    
    if ([self.topItem.rightBarButtonItems objectAtIndex:1]) {
        if ([[self.topItem.rightBarButtonItems objectAtIndex:1] isKindOfClass:[UIBarButtonItem class]]) {
            rightButtonWidth = ((UIBarButtonItem *)[self.topItem.rightBarButtonItems objectAtIndex:1]).customView.frame.size.width;
        }
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.topItem.leftBarButtonItem.customView.frame.origin.x + self.topItem.leftBarButtonItem.customView.frame.size.width,
                                                                        0 + kTitleVerticalMargin,
                                                                        self.frame.size.width - leftButtonWidth - rightButtonWidth,
                                                                        self.frame.size.height - kTitleVerticalMargin*2)];
    [label setFont:self.titleFont];

    [label setNumberOfLines:2];
    
    [label setBackgroundColor:[UIColor clearColor]];
    
    [label setTextColor:[UIColor whiteColor]];
    
    [label setTextAlignment:NSTextAlignmentCenter];
    
    [label setFont:[self getFontForString:title toFitInRect:label.frame seedFont:label.font]];

    if (label.font.pointSize < self.titleMinimumFontSize) {
        [label setFont:[UIFont fontWithName:label.font.fontName size:self.titleMinimumFontSize]];
    }
    
    [label setText:title];
    
    [self.topItem setTitleView:label];
}

- (void)setTitleTextFont:(UIFont *)font
{
    self.titleFont = font;
    [[UINavigationBar appearance] setTitleTextAttributes: @{ UITextAttributeFont: self.titleFont }];
}

- (void)setTitleTextMinimumFontSize:(int)fontSize
{
    self.titleMinimumFontSize = fontSize;
}

- (void)setFontAwesomeIconsSize:(int)fontSize
{
    self.buttonsFontAwesomeIconsSize = fontSize;
}

- (void)setButtonsTextFont:(UIFont *)font
{
    self.buttonsFont = font;
}

- (void)setBackgroundWithColor:(UIColor *)color
{
    self.gradientColor1 = color;
    self.gradientColor2 = color;
}

- (void)setBackgroundGradientWithColor1:(UIColor *)color1 andColor2:(UIColor *)color2
{
    self.gradientColor1 = color1;
    self.gradientColor2 = color2;
}

#pragma mark - Buttons + Text

- (void)setLeftButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action
{
    [self setLeftButtonWithText:buttonText target:target action:action withFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
}

- (void)setRightButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action
{
    [self setRightButtonWithText:buttonText target:target action:action withFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
}

- (void)setLeftButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame
{
    //Remove previous button
    self.topItem.leftBarButtonItem = nil;
    self.topItem.leftBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithText:buttonText target:target action:action withFrame:buttonFrame];
    
    //Add button
    [self setLeftButton:button];
}

- (void)setRightButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame
{
    //Remove previous button
    self.topItem.rightBarButtonItem = nil;
    self.topItem.rightBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithText:buttonText target:target action:action withFrame:buttonFrame];
    
    //Add button
    [self setRightButton:button];
}

- (void)setLeftButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2
{
    //Remove previous button
    self.topItem.leftBarButtonItem = nil;
    self.topItem.leftBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithText:buttonText target:target action:action withFrame:buttonFrame];

    //Apply gradient color
    [self drawBackgroundGradientInButton:button withColor1:color1 andColor2:color2];

    //Add button
    [self setLeftButton:button];
}

- (void)setRightButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2
{
    //Remove previous button
    self.topItem.rightBarButtonItem = nil;
    self.topItem.rightBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithText:buttonText target:target action:action withFrame:buttonFrame];
    
    //Apply gradient color
    [self drawBackgroundGradientInButton:button withColor1:color1 andColor2:color2];
    
    //Add button
    [self setRightButton:button];
}

#pragma mark - Buttons + FontAwesome

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action
{
    [self setLeftButtonWithFontAwesomeIcon:iconName target:target action:action withFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
}

- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action
{
    [self setRightButtonWithFontAwesomeIcon:iconName target:target action:action withFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
}

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame
{
    //Remove previous button
    self.topItem.leftBarButtonItem = nil;
    self.topItem.leftBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithFontAwesome:iconName target:target action:action withFrame:buttonFrame];
    
    //Add button
    [self setLeftButton:button];
}

- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame
{
    //Remove previous button
    self.topItem.rightBarButtonItem = nil;
    self.topItem.rightBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithFontAwesome:iconName target:target action:action withFrame:buttonFrame];
    
    //Add button
    [self setRightButton:button];
}

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2
{
    //Remove previous button
    self.topItem.leftBarButtonItem = nil;
    self.topItem.leftBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithFontAwesome:iconName target:target action:action withFrame:buttonFrame];
    
    //Apply gradient color
    [self drawBackgroundGradientInButton:button withColor1:color1 andColor2:color2];
    
    //Add button
    [self setLeftButton:button];
}

- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2
{
    //Remove previous button
    self.topItem.rightBarButtonItem = nil;
    self.topItem.rightBarButtonItems = nil;
    
    //Get button
    UIButton *button = [self getButtonWithFontAwesome:iconName target:target action:action withFrame:buttonFrame];
    
    //Apply gradient color
    [self drawBackgroundGradientInButton:button withColor1:color1 andColor2:color2];
    
    //Add button
    [self setRightButton:button];
}

#pragma mark - Buttons

- (void)setLeftButton:(UIButton *)button
{
    //Set UIBarButton
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    // Create a negative spacer to go to the left of our custom back button, and pull it right to the edge:
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    
    //Add button to navigation bar
    [self.topItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, barButton, nil]];
    
    //Resize title view
    if([self.topItem.titleView isKindOfClass:[UILabel class]]){
        [self setTitle:((UILabel *)self.topItem.titleView).text];
    }
}

- (void)setRightButton:(UIButton *)button
{
    //Set UIBarButton
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    // Create a negative spacer to go to the left of our custom back button, and pull it right to the edge:
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    
    //Add button to navigation bar
    [self.topItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer, barButton, nil]];
    
    //Resize title view
    if([self.topItem.titleView isKindOfClass:[UILabel class]]){
        [self setTitle:((UILabel *)self.topItem.titleView).text];
    }
}

- (UIButton *)getButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame
{
    //Define button
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    
    //Set font
    [button.titleLabel setFont:self.buttonsFont];
    
    //Set text
    [button setTitle:buttonText forState:UIControlStateNormal];
    
    //Define action of button
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //Padding button
    [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y, button.titleLabel.frame.size.width + 17*2, button.frame.size.height)];

    return button;
}

- (UIButton *)getButtonWithFontAwesome:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame
{
    //Define button
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    
    //FontAwesome icons should have left alignment
    [button.titleLabel setTextAlignment:NSTextAlignmentLeft];
    
    //Set FontAwesome font family
    [button.titleLabel setFont:[UIFont fontWithName:kFontAwesomeFamilyName size:self.buttonsFontAwesomeIconsSize]];

    //Set FontAwesome icon
    [button setTitle:[NSString fontAwesomeIconStringForIconIdentifier:iconName] forState:UIControlStateNormal];
    
    //Define action of button
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

-(UIFont*)getFontForString:(NSString*)string toFitInRect:(CGRect)rect seedFont:(UIFont*)seedFont
{
    UIFont *returnFont = seedFont;
    CGSize stringSize = CGSizeMake(rect.size.width-10, [string sizeWithFont:returnFont constrainedToSize:CGSizeMake(rect.size.width-10, 9999) lineBreakMode:NSLineBreakByWordWrapping].height); //-10 = Label padding
    
    while(stringSize.height >= rect.size.height){
        returnFont = [UIFont fontWithName:returnFont.fontName size:returnFont.pointSize - 1];
        stringSize = CGSizeMake(rect.size.width-10, [string sizeWithFont:returnFont constrainedToSize:CGSizeMake(rect.size.width-10, 9999) lineBreakMode:NSLineBreakByWordWrapping].height);
    }
    
    return returnFont;
}


#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    NSLog(@"Draw!");
    [super drawRect:rect];
    [self drawBackgroundGradientInRect:rect FromColor:self.gradientColor1 toColor:self.gradientColor2];
}

- (void)drawBackgroundGradientInRect:(CGRect)rect FromColor:(UIColor*)color1 toColor:(UIColor*)color2
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextAddRect(ctx, rect);
    CGContextClip(ctx);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    CGColorRef startColor = color1.CGColor;
    CGColorRef endColor = color2.CGColor;
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor, (__bridge id)endColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace,
                                                        (__bridge CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    
    CGContextRestoreGState(ctx);
}

- (void)drawBackgroundGradientInButton:(UIButton *)button withColor1:(UIColor *)color1 andColor2:(UIColor *)color2
{
    CAGradientLayer *layer = [CAGradientLayer layer];
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)color1.CGColor,
                       (id)color2.CGColor,
                       nil];
    [layer setColors:colors];
    [layer setFrame:button.bounds];
    [button.layer insertSublayer:layer atIndex:0];
    button.clipsToBounds = YES;
}

@end
