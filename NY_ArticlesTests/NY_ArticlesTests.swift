//
//  NY_ArticlesTests.swift
//  NY_ArticlesTests
//
//  Created by hager gamal on 2/6/21.
//

import XCTest
@testable import NY_Articles

class NY_ArticlesTests: XCTestCase {

    func testFetchArticles(){
        let articlesExpectation = XCTestExpectation()

        let viewModel = ArticlesViewModel()
        viewModel.FetchArticles(with: 7) { (state) in

           articlesExpectation.fulfill()
        }
        wait(for: [articlesExpectation], timeout: 5)
        
        XCTAssertNotNil(viewModel.articles)
    }

}
