//
//  ContactsPresenterTests.swift
//  ContactsDemoTests
//
//  Created by Artem Goncharov on 07.04.2021.
//

import XCTest
@testable import ContactsDemo

class ContactsPresenterTests: XCTestCase {
    
    var presenter: ContactsPresenter!

    override class func setUp() {
        
    }
    override func setUp() {
        super.setUp()
        let factory = DefaultServicesFactory()
        presenter = ContactsPresenter(contactsRepository: factory.getContactsRepository(), callHistoryRepository: factory.getCallHistoryRepository())
        
    }
    func test_viewOpened() throws {
        
    }
    func test_makeCall() throws {
        let newContact = Contact(recordId: "0", firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenter.makeCall(to: newContact))
        
        XCTAssertMessage
    }
    
    
    
    func test_newContactAdded() throws {
        let newContact = ContactsData(firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenter.newContactAdded(newContact))
    }
    
    override class func tearDown() {
        
    }
    override func tearDown() {
        super.tearDown()
    }
    override func addTeardownBlock(_ block: @escaping () -> Void) {
        super.addTeardownBlock(block)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
