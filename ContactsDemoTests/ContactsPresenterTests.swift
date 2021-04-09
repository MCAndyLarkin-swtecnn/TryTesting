//
//  ContactsPresenterTests.swift
//  ContactsDemoTests
//
//  Created by Artem Goncharov on 07.04.2021.
//

import XCTest
@testable import ContactsDemo

class ContactsPresenterTests: XCTestCase {
    
    var presenterS: ContactsPresenter!
    var presenterF: ContactsPresenter!

    override class func setUp() {
        
    }
    override func setUp() {
        super.setUp()
        presenterS = ContactsPresenter(contactsRepository: MokeSuccessContactsRepository(), callHistoryRepository: DefaultServicesFactory().getCallHistoryRepository())
        presenterF = ContactsPresenter(contactsRepository: MokeFailedContactsRepository(), callHistoryRepository: MokeFailedCallHistoryRepository() )
        
    }
    func test_viewOpened() throws {
        XCTAssertNoThrow(presenterS.viewOpened())
        presenterF.view = nil
        XCTAssertNoThrow(presenterF.viewOpened())
    }
    func test_makeCall() throws {
        let contact = Contact(recordId: "0", firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenterS.makeCall(to: contact))
        XCTAssertNoThrow(presenterF.makeCall(to: contact))
    }
    
    func test_contactPressed() throws {
        let contact = Contact(recordId: "0", firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenterS.contactPressed( contact))
    }
    
    func test_newContactAdded() throws {
        let newContact = ContactsData(firstName: "Imya", lastName: "Familiya", phone: "PhoneNumber")
        XCTAssertNoThrow(presenterS.newContactAdded(newContact))
        XCTAssertNoThrow(presenterF.newContactAdded(newContact))
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

class MokeSuccessContactsRepository: ContactsRepository{
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
class MokeFailedContactsRepository: ContactsRepository{
    func delete(contact: Contact) throws {
        print(#function)
    }
    
    func update(contact: Contact) throws {
        print(#function)
    }
    
    func getContacts() throws -> [Contact] {
        throw ContactsRepositoryErrors.getContacts
    }
    func add(contact: ContactsData) throws {
        throw ContactsRepositoryErrors.add
    }
}
enum ContactsRepositoryErrors: Error{
    case getContacts
    case add
    case getHistory
}
class MokeFailedCallHistoryRepository: CallHistoryRepository {
    func getHistory() throws -> [CallRecord] {
        throw ContactsRepositoryErrors.getHistory
    }
    
    func add(record: CallRecord) throws {
        throw ContactsRepositoryErrors.add
    }
    
}
