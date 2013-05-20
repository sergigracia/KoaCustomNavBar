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

@property (nonatomic, strong) UIColor *gradientColorTop;
@property (nonatomic, strong) UIColor *gradientColorBottom;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *buttonsFont;
@property (nonatomic) int titleMinimumFontSize;
@property (nonatomic) int buttonsFontAwesomeIconsSize;

@property (nonatomic, strong) UIView *bottomBar;

//Font
- (void)setTitleTextFont:(UIFont *)font;
- (void)setButtonsTextFont:(UIFont *)font;
- (void)setTitleTextMinimumFontSize:(int)fontSize;
- (void)setFontAwesomeIconsSize:(int)fontSize;

- (void)addBottomBarWithBarHeight:(int)barHeight barColor:(UIColor *)barColor;
- (void)removeBottomBar;

//Backgrounds
- (void)setBackgroundWithColor:(UIColor *)color;
- (void)setBackgroundGradientWithColorTop:(UIColor *)colorTop andColorBottom:(UIColor *)colorBottom;

//Title
- (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title textColor:(UIColor *)textColor;

//Buttons + Text
- (void)setLeftButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action;
- (void)setRightButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action;

- (void)setLeftButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withSize:(CGSize)buttonSize;
- (void)setRightButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withSize:(CGSize)buttonSize;

- (void)setLeftButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;
- (void)setRightButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;

- (void)setLeftButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withSize:(CGSize)buttonSize withGradientColorTop:(UIColor *)colorTop andGradientColorBottom:(UIColor *)colorBottom;
- (void)setRightButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withSize:(CGSize)buttonSize withGradientColorTop:(UIColor *)colorTop andGradientColorBottom:(UIColor *)colorBottom;

- (void)setLeftButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColorTop:(UIColor *)colorTop andGradientColorBottom:(UIColor *)colorBottom;
- (void)setRightButtonWithText:(NSString *)buttonText textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColorTop:(UIColor *)colorTop andGradientColorBottom:(UIColor *)colorBottom;

//Buttons + FontAwesome
- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action;

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action withSize:(CGSize)buttonSize;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action withSize:(CGSize)buttonSize;

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame;

- (void)setLeftButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColorTop:(UIColor *)colorTop andGradientColorBottom:(UIColor *)colorBottom;
- (void)setRightButtonWithFontAwesomeIcon:(NSString *)iconName textColor:(UIColor *)textColor target:(id)target action:(SEL)action withFrame:(CGRect)buttonFrame withGradientColorTop:(UIColor *)colorTop andGradientColorBottom:(UIColor *)colorBottom;

//Buttons
- (void)setLeftButton:(UIButton *)button;
- (void)setRightButton:(UIButton *)button;

@end
