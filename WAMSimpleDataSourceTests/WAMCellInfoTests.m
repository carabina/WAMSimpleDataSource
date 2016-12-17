//
//  WAMCellInfoTests.m
//  WAMSimpleDataSource
//
//  Created by wamaker on 2016/12/17.
//  Copyright © 2016年 wamaker. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WAMCellInfo.h"
#import "WAMTestsConstant.h"

@interface WAMCellInfoTests : XCTestCase

@end

@implementation WAMCellInfoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCellInitialization {
    WAMCellInfo *cellInfo = [WAMCellInfo infoWithReuseIdentifier:kCellReuseIdentifier title:kCellTitle detail:nil alias:kCellAlias];
    
    XCTAssertNotNil(cellInfo);
    XCTAssertEqual(cellInfo.reuseIdentifier, kCellReuseIdentifier);
    XCTAssertEqual(cellInfo.title, kCellTitle);
    XCTAssertEqual(cellInfo.alias, kCellAlias);
    XCTAssertNil(cellInfo.detail);
    XCTAssertNil(cellInfo.cell);
    
    cellInfo.detail = kCellDetail;
    XCTAssertEqual(cellInfo.detail, kCellDetail);
}

- (void)testSelfDefineCellInitialization {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellReuseIdentifier];
    WAMCellInfo *cellInfo = [WAMCellInfo infoWithSelfDefineCell:cell alias:nil];
    
    XCTAssertNotNil(cellInfo);
    XCTAssertEqual(cellInfo.cell, cell);
    XCTAssertNil(cellInfo.reuseIdentifier);
    XCTAssertNil(cellInfo.title);
    XCTAssertNil(cellInfo.detail);
    XCTAssertNil(cellInfo.alias);
    
    cellInfo.alias = kCellAlias;
    XCTAssertEqual(cellInfo.alias, kCellAlias);
}

@end
