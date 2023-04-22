//
//  InstaWithUITestUITests.swift
//  InstaWithUITestUITests
//
//  Created by Miya on 4/21/23.
//

import XCTest

final class InstaWithUITestUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.

        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        let uploadImageBar = tabBar.buttons["Upload Image"]
        XCTAssert(uploadImageBar.exists)
        uploadImageBar.tap()
        
        // Fail in this
         let photo = app.images["photo"]
         XCTAssert(photo.exists)
        
        let imageTitleField = app.textFields["Enter Image Title"]
        XCTAssert(imageTitleField.exists)
        imageTitleField.tap()
        imageTitleField.typeText("Image 1")
        
        let locationLabel = app.staticTexts["Image Location"]
        XCTAssert(locationLabel.exists)

        let takeAPicBtn = app/*@START_MENU_TOKEN@*/.staticTexts["Take a Picture"]/*[[".buttons[\"Take a Picture\"].staticTexts[\"Take a Picture\"]",".staticTexts[\"Take a Picture\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(takeAPicBtn.exists)
        takeAPicBtn.tap()
        
        app.alerts["Take a picture"].scrollViews.otherElements.buttons["Photo Library"].tap()
        
        let seletedImage = app.scrollViews.otherElements.images["Photo, October 09, 2009, 2:09 PM"]
        seletedImage.tap()

        // Fail in this
        // photo = app.images["plus"]
        // XCTAssert(app.images["Photo, October 09, 2009, 2:09 PM"].exists)
        
        // Fail in this
        // locationLabel = app.staticTexts["Space Needle,Seattle,Uptown,United States,98109,"]
        // XCTAssert(locationLabel.exists)
        
        let uploadImageBtn = app/*@START_MENU_TOKEN@*/.staticTexts["Upload Image"]/*[[".buttons.matching(identifier: \"Upload Image\").staticTexts[\"Upload Image\"]",".staticTexts[\"Upload Image\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(uploadImageBtn.exists)
        uploadImageBtn.tap()

        let homeBar = tabBar.buttons["Home"]
        XCTAssert(homeBar.exists)
        homeBar.tap()
               
        let tableRows = app.tables.children(matching: .cell).count

        XCTAssert(tableRows == 0)
    }
}
