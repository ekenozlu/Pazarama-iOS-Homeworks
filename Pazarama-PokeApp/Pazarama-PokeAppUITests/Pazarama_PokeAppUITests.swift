//
//  Pazarama_PokeAppUITests.swift
//  Pazarama-PokeAppUITests
//
//  Created by Eken Özlü on 3.11.2023.
//

import XCTest

final class Pazarama_PokeAppUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testExample() throws {
        // UI tests must launch the application that they test.
        
        
        let app = XCUIApplication()
        app.launch()
        
        let tagButton = app.buttons["tag"]
        tagButton.tap()
        
        let numberStaticText = app.staticTexts["Number (↑)"]
        numberStaticText.tap()
        
        let numberStaticText2 = app.staticTexts["Number (↓)"]
        numberStaticText2.tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element(boundBy: 2).tap()
        app.staticTexts["Name (Z→A)"].tap()
        app.staticTexts["Name (A→Z)"].tap()
        numberStaticText2.tap()
        numberStaticText.tap()
        tagButton.tap()
        app.textFields["Search"].tap()
        app.collectionViews.cells.containing(.staticText, identifier:"Charmander").element.tap()
        app.buttons["arrow back"].tap()
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
