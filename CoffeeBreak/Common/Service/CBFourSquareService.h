//
//  CBFourSquareService.h
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLLocation;

@interface CBFourSquareService : NSObject

- (void) sendRequest:(CLLocation *)location
            onSucces:(void (^)(NSDictionary *responseDic))onSuccessHandler
              onFail:(void (^)(NSError *error))onFailHandler;

@end
