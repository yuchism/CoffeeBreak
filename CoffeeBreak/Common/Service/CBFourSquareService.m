//
//  CBFourSquareService.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 6..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import "CBFourSquareService.h"
#import "AFNetworking.h"
#import "CBVenueListParser.h"
#import <CoreLocation/CoreLocation.h>




#define CLIENT_ID @"ACAO2JPKM1MXHQJCK45IIFKRFR2ZVL0QASMCBCG5NPJQWF2G"
#define CLIENT_SECRET @"YZCKUYJ1WHUV2QICBXUBEILZI1DMPUIDP5SHV043O04FKBHL"
#define FSAPI_VER @"20160406"

/**
 Setting Category : Coffee Shop
 https://developer.foursquare.com/categorytree
 Coffee Shop:
 4bf58dd8d48988d1e0931735
*/
#define CATEGORY_ID @"4bf58dd8d48988d1e0931735"



@interface CBFourSquareService()
{
    NSURLSessionTask *_task;
}
@property(atomic,strong) NSURLSessionTask *task;
@end

@implementation CBFourSquareService
@synthesize task = _task;

//cancel the task before deallocate.
- (void)dealloc
{
    if(self.task)
    {
        [self.task cancel];
        self.task = nil;
    }
}


- (void) sendRequest:(CLLocation *)location
            onSucces:(void (^)(NSDictionary *responseDic))onSuccessHandler
              onFail:(void(^)(NSError *error))onFailHandler
{
    if(self.task)
    {
        // if task is stll running, stop current request.
        return;
    }
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    NSString *ll = [NSString stringWithFormat:@"%f,%f",location.coordinate.latitude,location.coordinate.longitude];
    [param setObject:CLIENT_ID forKey:@"client_id"];
    [param setObject:CLIENT_SECRET forKey:@"client_secret"];
    [param setObject:FSAPI_VER forKey:@"v"];
    [param setObject:CATEGORY_ID forKey:@"categoryId"];
    [param setObject:ll forKey:@"ll"];
    
    self.task = [[AFHTTPSessionManager manager]
            GET:@"https://api.foursquare.com/v2/venues/search"
            parameters:param
            progress:nil
            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                NSDictionary *dic = [CBVenueListParser parse:responseObject];
                self.task = nil;
                if(onSuccessHandler)
                {
                    onSuccessHandler(dic);
                }
            }
            failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
            {
                self.task = nil;
                if(onFailHandler)
                {
                    onFailHandler(error);
                }
            }];
}




@end
