//
//  AppDelegate.m
//  KoaCustomNavBar
//
//  Created by Sergi Gracia on 13/05/13.
//  Copyright (c) 2013 Sergi Gracia. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [self addKoaCustomNavBarToNavigationController:navigationController];
    
    //Set rounded corners
    [navigationController.view.layer setCornerRadius:7];
    [navigationController.view.layer setMasksToBounds:YES];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)addKoaCustomNavBarToNavigationController:(UINavigationController *)navigationController
{
    [navigationController setValue:[[KoaCustomNavBar alloc] init] forKeyPath:@"navigationBar"];
    
    //Title
    [(KoaCustomNavBar *)navigationController.navigationBar setTitleTextFont:[UIFont fontWithName:@"OpenSans-Semibold" size:16]];
    [(KoaCustomNavBar *)navigationController.navigationBar setButtonsTextFont:[UIFont fontWithName:@"OpenSans-Bold" size:13]];
    [(KoaCustomNavBar *)navigationController.navigationBar setTitleMinimumFontSize:14];
    //[(KoaCustomNavBar *)navigationController.navigationBar setTitleMinimumFontSize:12];
    //[(KoaCustomNavBar *)navigationController.navigationBar setFontAwesomeIconsSize:28];
    
    //Background
    [(KoaCustomNavBar *)navigationController.navigationBar setBackgroundGradientWithColorTop:[UIColor colorWithRed:0.298 green:0.298 blue:0.298 alpha:1]
                                                                                 andColorBottom:[UIColor colorWithRed:0.231 green:0.231 blue:0.231 alpha:1]];
}

- (void)changeColor
{
    NSLog(@"ChangeColor!");
    [(KoaCustomNavBar *)self.window.rootViewController.navigationController.navigationBar setBackgroundGradientWithColorTop:[UIColor redColor] andColorBottom:[UIColor greenColor]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
