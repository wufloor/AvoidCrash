//
//  SceneDelegate.m
//  AvoidCrashDemo
//
//  Created by wuchunxu on 2023/9/25.
//  Copyright © 2023 chenfanfang. All rights reserved.
//

#import "SceneDelegate.h"
#import "ViewController.h"
@implementation SceneDelegate
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
	self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
	self.window.backgroundColor = [UIColor whiteColor];
	self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
	self.window.rootViewController = [[ViewController alloc]init];
	[self.window makeKeyAndVisible];
}
@end
