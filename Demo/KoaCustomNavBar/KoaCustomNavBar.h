//
//  KoaCustomNavBar.h
//  KoaCustomNavBar
//
//  Created by Sergi Gracia on 13/05/13.
//  Copyright (c) 2013 Sergi Gracia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface KoaCustomNavBar : UINavigationBar

@property (nonatomic, strong) UIColor *gradientColor1;
@property (nonatomic, strong) UIColor *gradientColor2;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *buttonsFont;
@property (nonatomic) int titleMinimumFontSize;
@property (nonatomic) int buttonsFontAwesomeIconsSize;

//Font
- (void)setTitleTextFont:(UIFont *)font;
- (void)setButtonsTextFont:(UIFont *)font;
- (void)setTitleTextMinimumFontSize:(int)fontSize;
- (void)setFontAwesomeIconsSize:(int)fontSize;

//Backgrounds
- (void)setBackgroundWithColor:(UIColor *)color;
- (void)setBackgroundGradientWithColor1:(UIColor *)color1 andColor2:(UIColor *)color2;

//Title
- (void)setTitle:(NSString *)title;

//Buttons + Text
- (void)setLeftButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action;
- (void)setRightButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action;

- (void)setLeftButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;
- (void)setRightButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;

- (void)setLeftButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2;
- (void)setRightButtonWithText:(NSString *)buttonText target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2;

//Buttons + FontAwesome
- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action;

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColor1:(UIColor *)color1 andGradientColor2:(UIColor *)color2;

//Buttons
- (void)setLeftButton:(UIButton *)button;
- (void)setRightButton:(UIButton *)button;

@end
