//
//  CBUtilsTests.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 7..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CBUtils.h"

@interface CBUtilsTests : XCTestCase

@end

@implementation CBUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddThousandSeperator
{
    XCTAssertEqualObjects([CBUtils addThousandSeperator:-1000000], @"-1,000,000",@"addThousandSeperator : must be -1,000") ;

    XCTAssertEqualObjects([CBUtils addThousandSeperator:-1000], @"-1,000",@"addThousandSeperator : must be -1,000") ;
    XCTAssertEqualObjects([CBUtils addThousandSeperator:-1], @"-1",@"addThousandSeperator : must be -1") ;
    XCTAssertEqualObjects([CBUtils addThousandSeperator:0], @"0",@"addThousandSeperator : must be 0") ;
    XCTAssertEqualObjects([CBUtils addThousandSeperator:1], @"1",@"addThousandSeperator : must be 1") ;
    XCTAssertEqualObjects([CBUtils addThousandSeperator:1000], @"1,000",@"addThousandSeperator : must be 1,000") ;
    XCTAssertEqualObjects([CBUtils addThousandSeperator:1000000], @"1,000,000",@"addThousandSeperator : must be 1,000,000") ;
}

- (void)testFourSquareIconURLwithPrefixSuffix
{
    {
        NSString *url = [CBUtils fourSquareIconURLwithPrefix:@"http://a.b_" suffix:@".png"];
        XCTAssertEqualObjects(url, @"http://a.b_44.png",@"");
    }
    {
        NSString *url = [CBUtils fourSquareIconURLwithPrefix:@"" suffix:@""];
        XCTAssertEqualObjects(url, @"44",@"");
    }
    {
        NSString *url = [CBUtils fourSquareIconURLwithPrefix:nil suffix:@".png"];
        XCTAssertEqualObjects(url, nil,@"");
    }
    {
        NSString *url = [CBUtils fourSquareIconURLwithPrefix:@"http://a.b_" suffix:nil];
        XCTAssertEqualObjects(url, nil,@"");
    }
    {
        NSString *url = [CBUtils fourSquareIconURLwithPrefix:nil suffix:nil];
        XCTAssertEqualObjects(url, nil,@"");
    }


}

@end
