//
//  UIViewController+AvoidCrash.m
//  AvoidCrashDemo
//
//  Created by wuchunxu on 2023/9/25.
//  Copyright © 2023 chenfanfang. All rights reserved.
//

#import "UIViewController+AvoidCrash.h"
#import "AvoidCrash.h"
@implementation UIViewController (AvoidCrash)
+ (void)avoidCrashExchangeMethod {
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		
		[AvoidCrash exchangeInstanceMethod:self method1Sel:@selector(presentViewController:animated:completion:) method2Sel:@selector(avoidCrashPresentViewController:animated:completion:)];
	});
}

- (void)avoidCrashPresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
	
	if(self.presentedViewController) return;
	if(viewControllerToPresent.isBeingPresented) return;
	if(!viewControllerToPresent) return;
	
	@try {
		[self avoidCrashPresentViewController:viewControllerToPresent animated:flag completion:completion];
	}
	@catch (NSException *exception) {
		[AvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultIgnore];
	}
	@finally {
		
	}
	
}
@end
