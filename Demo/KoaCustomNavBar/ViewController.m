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
 
    [(KoaCustomNavBar *)self.navigationController.navigationBar setTitle:@"KoaNavBar with a very long long long long long long title"];
    
    [(KoaCustomNavBar *)self.navigationController.navigationBar setLeftButtonWithFontAwesomeIcon:@"icon-reorder" target:nil action:nil];
    [(KoaCustomNavBar *)self.navigationController.navigationBar setRightButtonWithText:@"Save" target:nil action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
