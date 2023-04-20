//
//  UITestSampleUITests.swift
//  UITestSampleUITests
//
//  Created by Miya on 4/20/23.
//

import XCTest

final class UITestSampleUITests: XCTestCase {

    func testLoginHappyPath() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["Email"]
        XCTAssert(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("miya@test.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssert(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        let loginBtn = app.staticTexts["Login"]
        XCTAssert(loginBtn.exists)
        loginBtn.tap()
        
        let LoggedInLabel = app.staticTexts["Logged In"]
        XCTAssert(LoggedInLabel.exists)
    }
    
    func testLoginFailed() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let emailTextField = app.textFields["Email"]
        XCTAssert(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("miya@test.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssert(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("WrongPassword")
        
        let loginBtn = app.staticTexts["Login"]
        XCTAssert(loginBtn.exists)
        loginBtn.tap()
        
        let statusLabel = app.staticTexts["Please enter valid email/password"]
        XCTAssert(statusLabel.exists)
    }

}


