//
//  NSDictionary+Validation.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary(Validation)

- (id) validObjectForKey:(id)aKey;
- (NSInteger) integerForKey:(id)akey;
- (double) doubleForKey:(id)aKey;

@end
