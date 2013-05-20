//
//  ViewController.m
//  KoaCustomNavBar
//
//  Created by Sergi Gracia on 13/05/13.
//  Copyright (c) 2013 Sergi Gracia. All rights reserved.
//

#import "ViewController.h"
#import "KoaCustomNavBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setTitle:@"KoaNavBar with a long title"];
    [self.navigationController setNavigationBarHidden:NO];
 
    [(KoaCustomNavBar *)self.navigationController.navigationBar setTitle:@"New Task"];
    
//    [(KoaCustomNavBar *)self.navigationController.navigationBar setLeftButtonWithFontAwesomeIcon:@"icon-reorder" target:nil action:nil];
//    [(KoaCustomNavBar *)self.navigationController.navigationBar setRightButtonWithText:@"Save" target:nil action:nil];
    
    [(KoaCustomNavBar *)self.navigationController.navigationBar setRightButtonWithText:@"Save" textColor:[UIColor whiteColor] target:self action:@selector(aloha) withSize:CGSizeMake(66, 44)
                                                                    withGradientColorTop:[UIColor colorWithRed:64/255.f green:169/255.f blue:212/255.f alpha:1]
                                                                     andGradientColorBottom:[UIColor colorWithRed:45/255.f green:138/255.f blue:180/255.f alpha:1]];
    
    [(KoaCustomNavBar *)self.navigationController.navigationBar setLeftButtonWithText:@"Cancel" textColor:[UIColor whiteColor] target:nil action:nil withSize:CGSizeMake(66, 44)
                                                                    withGradientColorTop:[UIColor colorWithRed:96/255.f green:96/255.f blue:96/255.f alpha:1]
                                                                     andGradientColorBottom:[UIColor colorWithRed:79/255.f green:79/255.f blue:79/255.f alpha:1]];
    
    [(KoaCustomNavBar *)self.navigationController.navigationBar addBottomBarWithBarHeight:2 barColor:[UIColor colorWithRed:85/255.f green:85/255.f blue:85/255.f alpha:0.2]];
}

- (void)aloha
{
    [(KoaCustomNavBar *)self.navigationController.navigationBar removeBottomBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
