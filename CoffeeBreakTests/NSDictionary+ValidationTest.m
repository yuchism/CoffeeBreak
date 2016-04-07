//
//  NSDictionary+ValidationTest.m
//  CoffeeBreak
//
//  Created by yu chung hyun on 2016. 4. 7..
//  Copyright © 2016년 John Yu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+Validation.h"

@interface NSDictionary_ValidationTest : XCTestCase

@end

@implementation NSDictionary_ValidationTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
/*
- (id) validObjectForKey:(id)aKey;
- (NSInteger) integerForKey:(id)akey;
- (double) doubleForKey:(id)aKey;
*/
- (void)testValidObjectForKey
{
    {
        NSDictionary *dic = @{@"key1":@"value1"};
        XCTAssertEqualObjects([dic validObjectForKey:@"key1"],@"value1",@"");
    }
    {
        NSDictionary *dic = @{};
        XCTAssertEqualObjects([dic validObjectForKey:@"key1"],nil,@"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNull null]};
        XCTAssertEqualObjects([dic validObjectForKey:@"key1"],nil,@"");
    }
    {
        NSDictionary *dic = @{@"key1":@"value1"};
        XCTAssertEqualObjects([dic validObjectForKey:@"wrongKey"],nil,@"");
    }
    {
        NSDictionary *dic = @{@"key1":@"value1"};
        XCTAssertEqualObjects([dic validObjectForKey:@""],nil,@"");
    }
}

- (void)testIntegerForKey
{
    //test wrong key
    {
        NSDictionary *dic = @{@"key1":@"1"};
        XCTAssertEqual([dic integerForKey:@"wrongKey"],0, @"");
    }

    
    //test for string object
    {
        NSDictionary *dic = @{@"key1":@"1"};
        XCTAssertEqual([dic integerForKey:@"key1"], 1, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"-1"};
        XCTAssertEqual([dic integerForKey:@"key1"], -1, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"0"};
        XCTAssertEqual([dic integerForKey:@"key1"], 0, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"100asdf"};
        XCTAssertEqual([dic integerForKey:@"key1"], 100, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"asd1"};
        XCTAssertEqual([dic integerForKey:@"key1"], 0, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"1,000,000"};
        XCTAssertEqual([dic integerForKey:@"key1"],1, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"1.900234"};
        XCTAssertEqual([dic integerForKey:@"key1"], 1, @"");
    }
    
    // test number object
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithInteger:1]};
        XCTAssertEqual([dic integerForKey:@"key1"], 1, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithInteger:0]};
        XCTAssertEqual([dic integerForKey:@"key1"], 0, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithInteger:1000]};
        XCTAssertEqual([dic integerForKey:@"key1"], 1000, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithInteger:-1000]};
        XCTAssertEqual([dic integerForKey:@"key1"], -1000, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithFloat:1.9]};
        XCTAssertEqual([dic integerForKey:@"key1"], 1, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithFloat:0.231]};
        XCTAssertEqual([dic integerForKey:@"key1"], 0 ,@"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithUnsignedInteger:100]};
        XCTAssertEqual([dic integerForKey:@"key1"], 100, @"");
    }

}

- (void)testDoubleForKey
{
    //test wrong key
    {
        NSDictionary *dic = @{@"key1":@"1"};
        XCTAssertEqual([dic doubleForKey:@"wrongKey"],0, @"");
    }
    
    
    //test for string object
    {
        NSDictionary *dic = @{@"key1":@"1.01"};
        XCTAssertEqual([dic doubleForKey:@"key1"], 1.01, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"-1.01"};
        XCTAssertEqual([dic doubleForKey:@"key1"], -1.01, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"0.0000000000"};
        XCTAssertEqual([dic doubleForKey:@"key1"], 0, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"100.101asdf"};
        XCTAssertEqual([dic doubleForKey:@"key1"], 100.101, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"asd1"};
        XCTAssertEqual([dic doubleForKey:@"key1"], 0, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"1.004,000"};
        XCTAssertEqual([dic doubleForKey:@"key1"],1.004, @"");
    }
    {
        NSDictionary *dic = @{@"key1":@"1.900234"};
        XCTAssertEqual([dic doubleForKey:@"key1"], 1.900234, @"");
    }
    
    // test number object
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithDouble:1.234]};
        XCTAssertEqual([dic doubleForKey:@"key1"], 1.234, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithDouble:0]};
        XCTAssertEqual([dic doubleForKey:@"key1"], 0, @"");
    }
    {
        NSDictionary *dic = @{@"key1":[NSNumber numberWithDouble:-1.234]};
        XCTAssertEqual([dic doubleForKey:@"key1"], -1.234, @"");
    }
}



@end
