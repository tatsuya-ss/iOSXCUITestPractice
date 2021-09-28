//
//  iOSXCUITestPracticeUITests.swift
//  iOSXCUITestPracticeUITests
//
//  Created by 坂本龍哉 on 2021/09/25.
//

import XCTest

final class FirstStep: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch() /// 起動
    }
    
    override func tearDown() {
        
    }
    
    func testExample() {
        
        let loginView = app.otherElements["login_root_view"]
        XCTContext.runActivity(named: "ログイン画面が表示される") { _ in
            XCTAssert(loginView.exists)
        }
        XCTContext.runActivity(named: "ログイン情報を入力する") { _ in
            let userName = app.textFields["login_name_textfield"]
            let password = app.secureTextFields["login_password_textfield"]
            XCTAssert(userName.exists)
            XCTAssert(password.exists)
            userName.tap()
            userName.typeText("iwomm")
            password.tap()
            password.typeText("MyP@ssworD")
        }
        XCTContext.runActivity(named: "ログインボタンをタップする") { _ in
            loginView.tap()
            let button = app.buttons["login_login_button"]
            XCTAssert(button.exists)
            button.tap()
        }
        XCTContext.runActivity(named: "トップ画面が表示される") { _ in
            let top = app.otherElements["top_root_view"]
            XCTAssert(top.waitForExistence(timeout: 2)) // 失敗する時もあるなら、待ち処理を作成して安全にテストする
        }
    }
    
}

class iOSXCUITestPracticeUITests: XCTestCase {
    
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
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
