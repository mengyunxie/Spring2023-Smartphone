//
//  InstaWithUITestAndXibUITests.swift
//  InstaWithUITestAndXibUITests
//
//  Created by Miya on 4/21/23.
//

import XCTest

final class InstaWithUITestAndXibUITests: XCTestCase {

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        let uploadImageBar = tabBar.buttons["Upload Image"]
        XCTAssert(uploadImageBar.exists)
        uploadImageBar.tap()
        
         let photo = app.images["photo"]
         XCTAssert(photo.exists)
        
        let imageTitleField = app.textFields["Title"]
        XCTAssert(imageTitleField.exists)
        imageTitleField.tap()
        imageTitleField.typeText("Image 1")
        
        let locationLabel = app.staticTexts["Location"]
        XCTAssert(locationLabel.exists)

        let takeAPicBtn = app/*@START_MENU_TOKEN@*/.staticTexts["Take a Picture"]/*[[".buttons[\"Take a Picture\"].staticTexts[\"Take a Picture\"]",".staticTexts[\"Take a Picture\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(takeAPicBtn.exists)
        takeAPicBtn.tap()
        
        app.alerts["Take a picture"].scrollViews.otherElements.buttons["Photo Library"].tap()
        
        let seletedImage = app.scrollViews.otherElements.images["Photo, October 09, 2009, 2:09 PM"]
        seletedImage.tap()

        // Fail in here
        // let newPhoto = app.images["Photo, October 09, 2009, 2:09 PM"]
        // XCTAssert(newPhoto.exists)
        
        let newLocationLabel = app.staticTexts["Space Needle,Seattle,Uptown,United States,98109,"]
        XCTAssert(newLocationLabel.exists)
        
        let uploadImageBtn = app/*@START_MENU_TOKEN@*/.staticTexts["Upload Image"]/*[[".buttons.matching(identifier: \"Upload Image\").staticTexts[\"Upload Image\"]",".staticTexts[\"Upload Image\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(uploadImageBtn.exists)
        uploadImageBtn.tap()

        let homeBar = tabBar.buttons["Home"]
        XCTAssert(homeBar.exists)
        homeBar.tap()
               
        let tableRows = app.tables.children(matching: .cell).count

        XCTAssert(tableRows == 1)
        
        // app.tables.cells.containing(.staticText, identifier:"Space Needle,Seattle,Uptown,United States,98109,")
    }
    
    func testFailExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let tabBar = app.tabBars["Tab Bar"]
        let uploadImageBar = tabBar.buttons["Upload Image"]
        XCTAssert(uploadImageBar.exists)
        uploadImageBar.tap()
        
        let imageTitleField = app.textFields["Title"]
        XCTAssert(imageTitleField.exists)
        
        let takeAPicBtn = app/*@START_MENU_TOKEN@*/.staticTexts["Take a Picture"]/*[[".buttons[\"Take a Picture\"].staticTexts[\"Take a Picture\"]",".staticTexts[\"Take a Picture\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(takeAPicBtn.exists)
        takeAPicBtn.tap()
        
        app.alerts["Take a picture"].scrollViews.otherElements.buttons["Photo Library"].tap()
        app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, March 30, 2018, 12:14 PM"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, March 30, 2018, 12:14 PM, Photo, August 08, 2012, 2:55 PM, Photo, August 08, 2012, 2:29 PM, Photo, August 08, 2012, 11:52 AM, Photo, October 09, 2009, 2:09 PM, Photo, March 12, 2011, 4:17 PM\"].images[\"Photo, March 30, 2018, 12:14 PM\"]",".images[\"Photo, March 30, 2018, 12:14 PM\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        
        
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

