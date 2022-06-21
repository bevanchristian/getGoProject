//
//  getGoProjectUITests.swift
//  getGoProjectUITests
//
//  Created by bevan christian on 20/06/22.
//

import XCTest

class getGoProjectUITests: XCTestCase {

    func test_navigationToDetail() {
        let app =  XCUIApplication()
        app.launch()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Rick Sanchez, Human, Alive"].press(forDuration: 2.3);/*[[".cells[\"Rick Sanchez, Human, Alive\"].buttons[\"Rick Sanchez, Human, Alive\"]",".tap()",".press(forDuration: 2.3);",".buttons[\"Rick Sanchez, Human, Alive\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    }
    
    func test_navigationToDetailandBack() {
        let app = XCUIApplication()
        app.launch()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Rick Sanchez, Human, Alive"].press(forDuration: 2.0);/*[[".cells[\"Rick Sanchez, Human, Alive\"].buttons[\"Rick Sanchez, Human, Alive\"]",".tap()",".press(forDuration: 2.0);",".buttons[\"Rick Sanchez, Human, Alive\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Back"].tap()
    }
    
}
