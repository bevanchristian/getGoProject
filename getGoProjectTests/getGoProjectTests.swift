//
//  getGoProjectTests.swift
//  getGoProjectTests
//
//  Created by bevan christian on 20/06/22.
//

import XCTest
import Combine
@testable import getGoProject

class getGoProjectTests: XCTestCase {

    var subscription = Set<AnyCancellable>()
    
    func testUrlEnpoint() {
        // Testing our endpoint url
        let urlPage_one = UrlConstant.base("1").urlString
        let urlPage_two = UrlConstant.base("2").urlString
   
        let urlPage_one_correct = "https://rickandmortyapi.com/api/character/?page=1"
        let urlPage_two_correct = "https://rickandmortyapi.com/api/character/?page=2"
        
        XCTAssertEqual(urlPage_one, urlPage_one_correct)
        XCTAssertEqual(urlPage_two, urlPage_two_correct)
    }
    
    func testPostValidResponse() {
        // given mock api
        let apiMock = ApiMock()
        // when case is success
        apiMock.caseType = .success
        let request = NetworkService(env: RequestUtils(apiRequest: apiMock))
        // then message error must nil
        request.characterResult.dropFirst().sink(receiveValue: { char in
            XCTAssertNotNil(char?.results)
        }).store(in: &subscription)
        
        request.getCharacter()


    }
    
    func testPostInvalidResponse() {
        // given mock api
        let apiMock = ApiMock()
        // when case is invalid data
        apiMock.caseType = .failed
        let request = NetworkService(env: RequestUtils(apiRequest: apiMock))
        
        // then message must contain error enpoint
        request.apiError.sink { err in
            XCTAssertEqual("Decode Error", err.description)
        }.store(in: &subscription)
        
        request.getCharacter()

    }
    

}
