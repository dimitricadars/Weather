//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Dimitri CADARS on 12/12/2021.
//

import XCTest

class WeatherUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWeatherList() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print(app.debugDescription)
        let tableView = app.tables["weatherTableView"]
        XCTAssertTrue(tableView.exists, "weatherTableView doesn't exist")
        XCTAssertTrue(app.buttons["settingsButton"].exists, "settingsButton doesn't exist")
        XCTAssertTrue(app.buttons["addButton"].exists, "addButton doesn't exist")
        
        app.swipeUp()
        app.swipeDown()
    }
    
    func testAddCity() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print(app.debugDescription)
        let weatherTableView = app.tables["weatherTableView"]
        XCTAssertTrue(weatherTableView.exists, "weatherTableView doesn't exist")
        XCTAssertTrue(app.buttons["settingsButton"].exists, "settingsButton doesn't exist")
        XCTAssertTrue(app.buttons["addButton"].exists, "addButton doesn't exist")
        
        app.buttons["addButton"].tap()
        XCTAssertTrue(app.textFields["cityNameTextFiled"].exists, "cityNameTextFiled doesn't exist")
        XCTAssertTrue(app.buttons["saveButton"].exists, "settingsButton doesn't exist")
        
        let cityNameTextFiled = app.textFields["cityNameTextFiled"]
        cityNameTextFiled.tap()
        cityNameTextFiled.typeText("Paris")
        XCTAssertEqual(cityNameTextFiled.value as! String, "Paris")
        app.buttons["saveButton"].tap()
        
        let cells = weatherTableView.cells
        XCTAssertGreaterThanOrEqual(cells.count, 0)
        
        if cells.count > 0 {
            let promise = expectation(description: "weatherCells expectation")
            
            let weatherCell = cells.element(boundBy: 0)
            XCTAssertTrue(weatherCell.exists, "weatherCell doesn't exist")
            promise.fulfill()
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(true, "failure")
        
            XCTAssertTrue(app.staticTexts["cityNameLabel"].exists, "cityNameLabel doesn't exist")
            XCTAssertTrue(app.images["iconImage"].exists, "iconImage doesn't exist")
            XCTAssertTrue(app.staticTexts["temperatureLabel"].exists, "temperatureLabel doesn't exist")
        } else {
            XCTAssert(false, "weatherCells doesn't exist")
        }
        
    }
    
    func testSettings() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print(app.debugDescription)
        let weatherTableView = app.tables["weatherTableView"]
        XCTAssertTrue(weatherTableView.exists, "weatherTableView doesn't exist")
        XCTAssertTrue(app.buttons["settingsButton"].exists, "settingsButton doesn't exist")
        XCTAssertTrue(app.buttons["addButton"].exists, "addButton doesn't exist")
        
        app.buttons["settingsButton"].tap()
        let settingsTableView = app.tables["settingsTableView"]
        XCTAssertTrue(settingsTableView.exists, "settingsTableView doesn't exist")
        
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
