//
//  NSArray+AvoidCrash.m
//  https://github.com/chenfanfang/AvoidCrash
//
//  Created by mac on 16/9/21.
//  Copyright © 2016年 chenfanfang. All rights reserved.
//

#import "NSArray+AvoidCrash.h"

#import "AvoidCrash.h"

@implementation NSArray (AvoidCrash)


+ (void)avoidCrashExchangeMethod {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //=================
        //   class method
        //=================
        
        //instance array method exchange
        [AvoidCrash exchangeClassMethod:[self class] method1Sel:@selector(arrayWithObjects:count:) method2Sel:@selector(AvoidCrashArrayWithObjects:count:)];
        
        
        
        //====================
        //   instance method
        //====================
        
        Class __NSArray = NSClassFromString(@"NSArray");
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
        Class __NSArray0 = NSClassFromString(@"__NSArray0");
		Class __NSPlaceholderArray = NSClassFromString(@"__NSPlaceholderArray");
		Class NSConstantArray = NSClassFromString(@"NSConstantArray");
        //objectsAtIndexes:
        [AvoidCrash exchangeInstanceMethod:__NSArray method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(avoidCrashObjectsAtIndexes:)];
        
		[AvoidCrash exchangeInstanceMethod:[self class] method1Sel:@selector(objectsAtIndexes:) method2Sel:@selector(NSArrayAvoidCrashObjectsAtIndexes:)];

        //objectAtIndex:
        
        [AvoidCrash exchangeInstanceMethod:__NSArrayI method1Sel:@selector(objectAtIndex:) method2Sel:@selector(__NSArrayIAvoidCrashObjectAtIndex:)];
        
        [AvoidCrash exchangeInstanceMethod:__NSSingleObjectArrayI method1Sel:@selector(objectAtIndex:) method2Sel:@selector(__NSSingleObjectArrayIAvoidCrashObjectAtIndex:)];
        
        [AvoidCrash exchangeInstanceMethod:__NSArray0 method1Sel:@selector(objectAtIndex:) method2Sel:@selector(__NSArray0AvoidCrashObjectAtIndex:)];
        
        //objectAtIndexedSubscript:
		[AvoidCrash exchangeInstanceMethod:__NSArrayI method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(__NSArrayIAvoidCrashObjectAtIndexedSubscript:)];
		
		[AvoidCrash exchangeInstanceMethod:NSConstantArray method1Sel:@selector(objectAtIndexedSubscript:) method2Sel:@selector(NSConstantArrayIAvoidCrashObjectAtIndexedSubscript:)];
        
        //getObjects:range:
        [AvoidCrash exchangeInstanceMethod:__NSArray method1Sel:@selector(getObjects:range:) method2Sel:@selector(NSArrayAvoidCrashGetObjects:range:)];
        
        [AvoidCrash exchangeInstanceMethod:__NSSingleObjectArrayI method1Sel:@selector(getObjects:range:) method2Sel:@selector(__NSSingleObjectArrayIAvoidCrashGetObjects:range:)];
        
        [AvoidCrash exchangeInstanceMethod:__NSArrayI method1Sel:@selector(getObjects:range:) method2Sel:@selector(__NSArrayIAvoidCrashGetObjects:range:)];
		
		[AvoidCrash exchangeInstanceMethod:NSConstantArray method1Sel:@selector(getObjects:range:) method2Sel:@selector(NSConstantArrayAvoidCrashGetObjects:range:)];

		
		//initWithObjects:count:
		[AvoidCrash exchangeInstanceMethod:__NSPlaceholderArray method1Sel:@selector(initWithObjects:count:) method2Sel:@selector(__NSPlaceholderArrayAvoidCrashInitWithObjects:count:)];

    });
    
    
}


//=================================================================
//                        instance array
//=================================================================
#pragma mark - instance array


+ (instancetype)AvoidCrashArrayWithObjects:(const id  _Nonnull __unsafe_unretained *)objects count:(NSUInteger)cnt {
    
    id instance = nil;
    
    @try {
        instance = [self AvoidCrashArrayWithObjects:objects count:cnt];
    }
    @catch (NSException *exception) {
        
        NSString *defaultToDo = @"AvoidCrash default is to remove nil object and instance a array.";
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
        //以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
        NSInteger newObjsIndex = 0;
        id  _Nonnull __unsafe_unretained newObjects[cnt];
        
        for (int i = 0; i < cnt; i++) {
            if (objects[i] != nil) {
                newObjects[newObjsIndex] = objects[i];
                newObjsIndex++;
            }
        }
        instance = [self AvoidCrashArrayWithObjects:newObjects count:newObjsIndex];
    }
    @finally {
        return instance;
    }
}



//=================================================================
//                     objectAtIndexedSubscript:
//=================================================================
#pragma mark - objectAtIndexedSubscript:
- (id)__NSArrayIAvoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
    id object = nil;
    
    @try {
        object = [self __NSArrayIAvoidCrashObjectAtIndexedSubscript:idx];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }

}

- (id)NSConstantArrayIAvoidCrashObjectAtIndexedSubscript:(NSUInteger)idx {
	id object = nil;
	
	@try {
		object = [self NSConstantArrayIAvoidCrashObjectAtIndexedSubscript:idx];
	}
	@catch (NSException *exception) {
		NSString *defaultToDo = AvoidCrashDefaultReturnNil;
		[AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
	}
	@finally {
		return object;
	}

}

//=================================================================
//                       objectsAtIndexes:
//=================================================================
#pragma mark - objectsAtIndexes:

- (NSArray *)avoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
    
    NSArray *returnArray = nil;
    @try {
        returnArray = [self avoidCrashObjectsAtIndexes:indexes];
    } @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        return returnArray;
    }
}

- (NSArray *)NSArrayAvoidCrashObjectsAtIndexes:(NSIndexSet *)indexes {
	
	NSArray *returnArray = nil;
	@try {
		returnArray = [self NSArrayAvoidCrashObjectsAtIndexes:indexes];
	} @catch (NSException *exception) {
		NSString *defaultToDo = AvoidCrashDefaultReturnNil;
		[AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
		
	} @finally {
		return returnArray;
	}
}



//=================================================================
//                         objectAtIndex:
//=================================================================
#pragma mark - objectAtIndex:

//__NSArrayI  objectAtIndex:
- (id)__NSArrayIAvoidCrashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self __NSArrayIAvoidCrashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}



//__NSSingleObjectArrayI objectAtIndex:
- (id)__NSSingleObjectArrayIAvoidCrashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self __NSSingleObjectArrayIAvoidCrashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}

//__NSArray0 objectAtIndex:
- (id)__NSArray0AvoidCrashObjectAtIndex:(NSUInteger)index {
    id object = nil;
    
    @try {
        object = [self __NSArray0AvoidCrashObjectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSString *defaultToDo = AvoidCrashDefaultReturnNil;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
    }
    @finally {
        return object;
    }
}


//=================================================================
//                           getObjects:range:
//=================================================================
#pragma mark - getObjects:range:

//NSArray getObjects:range:
- (void)NSArrayAvoidCrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self NSArrayAvoidCrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
}


//__NSSingleObjectArrayI  getObjects:range:
- (void)__NSSingleObjectArrayIAvoidCrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self __NSSingleObjectArrayIAvoidCrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
}


//__NSArrayI  getObjects:range:
- (void)__NSArrayIAvoidCrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
    
    @try {
        [self __NSArrayIAvoidCrashGetObjects:objects range:range];
    } @catch (NSException *exception) {
        
        NSString *defaultToDo = AvoidCrashDefaultIgnore;
        [AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
        
    } @finally {
        
    }
}

- (void)NSConstantArrayAvoidCrashGetObjects:(__unsafe_unretained id  _Nonnull *)objects range:(NSRange)range {
	
	@try {
		[self NSConstantArrayAvoidCrashGetObjects:objects range:range];
	} @catch (NSException *exception) {
		
		NSString *defaultToDo = AvoidCrashDefaultIgnore;
		[AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
		
	} @finally {
		
	}
}


- (instancetype)__NSPlaceholderArrayAvoidCrashInitWithObjects:(__unsafe_unretained id  _Nonnull *)objects count:(NSUInteger)cnt {
	id instance = nil;
	
	@try {
		instance = [self __NSPlaceholderArrayAvoidCrashInitWithObjects:objects count:cnt];
	}
	@catch (NSException *exception) {
		
		NSString *defaultToDo = @"AvoidCrash default is to remove nil object and instance a array.";
		[AvoidCrash noteErrorWithException:exception defaultToDo:defaultToDo];
		
		//以下是对错误数据的处理，把为nil的数据去掉,然后初始化数组
		NSInteger newObjsIndex = 0;
		id  _Nonnull __unsafe_unretained newObjects[cnt];
		
		for (int i = 0; i < cnt; i++) {
			if (objects[i] != nil) {
				newObjects[newObjsIndex] = objects[i];
				newObjsIndex++;
			}
		}
		instance = [self __NSPlaceholderArrayAvoidCrashInitWithObjects:newObjects count:newObjsIndex];
	}
	@finally {
		return instance;
	}
}


@end
