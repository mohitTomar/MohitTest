//
//  DataModelUnitTest.swift
//  XebiaTestTests
//
//  Created by MohitTomar-iOS on 05/03/2020.
//  Copyright © 2020 Engineer.AI All rights reserved.
//

import XCTest
@testable import XebiaTest

class DataModelUnitTest: XCTestCase {
    var mostPopularNewsDataModel:MostPopularDataModel!


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let newsModel = NewsDataModel.init(title: "News", abstract: "everything is news today", published_date: "22-11-1988", byline: "by Mohit Tomar", mediaUrl: ["https://www.team8.vc/wp-content/uploads/2017/07/img_avatar.jpg"])
        mostPopularNewsDataModel = MostPopularDataModel.init(status: "ok", copyright: "Mohittomar", num_results: 10, results: [newsModel])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mostPopularNewsDataModel = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertTrue(mostPopularNewsDataModel.status == "ok")
         XCTAssertTrue(mostPopularNewsDataModel.copyright == "mohittomar")
         XCTAssertTrue(mostPopularNewsDataModel.num_results == 10)
        XCTAssertTrue(mostPopularNewsDataModel.results?.count ?? 0 > 0 )
        
        let model = mostPopularNewsDataModel.results![0]
        
        XCTAssertTrue(model.title == "News")
        XCTAssertTrue(model.abstract == "everything is news today")
        XCTAssertTrue(model.published_date == "22/11/1988")
        XCTAssertTrue(model.byline == "by mohit tomar")
        XCTAssertTrue(model.mediaUrl?.count ?? 0 > 0)
        XCTAssertFalse(model.byline == "by mohit tomar")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let newsModel = NewsDataModel.init(title: "News", abstract: "everything is news today", published_date: "22/11/1988", byline: "by mohit tomar", mediaUrl: ["https://www.team8.vc/wp-content/uploads/2017/07/img_avatar.jpg"])
            mostPopularNewsDataModel = MostPopularDataModel.init(status: "ok", copyright: "mohittomar", num_results: 10, results: [newsModel])
        }
    }

}
