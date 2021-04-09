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
        presenter = ContactsPresenter(contactsRepository: MokeContactsRepository(), callHistoryRepository: DefaultServicesFactory().getCallHistoryRepository())
        
    }
    func test_viewOpened() throws {
        XCTAssertNoThrow(presenter.viewOpened())
    }
    func test_makeCall() throws {
        let contact = Contact(recordId: "0", firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenter.makeCall(to: contact))
    }
    
    func test_contactPressed() throws {
        let contact = Contact(recordId: "0", firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenter.contactPressed( contact))
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
}

class MokeContactsRepository: ContactsRepository{
    func getContacts() throws -> [Contact] {
        print(#function)
        return []
    }
    
    func delete(contact: Contact) throws {
        print(#function)
    }
    
    func update(contact: Contact) throws {
        print(#function)
    }
    
    func add(contact: ContactsData) throws {
        print(#function)
    }
}
