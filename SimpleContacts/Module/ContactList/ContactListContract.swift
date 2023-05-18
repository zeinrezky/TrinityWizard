//
//  ContactListContract.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

protocol ContactListPresenterProtocol: AnyObject {
    func updateContact(contact: Contact)
    func getListContact() -> [Contact]
    func navigateToDetail(contact: Contact)
    func pullToRefresh()
}

protocol ContactListViewProtocol: AnyObject {
    func refreshCollection()
}

protocol ContactListInteractorInputProtocol: AnyObject {
    func getListContact() -> [Contact]
    func pullToRefresh()
    func updateContact(newContact: Contact)
}

protocol ContactListInteractorOutputProtocol: AnyObject {
    func didUpdateContact()
}

protocol ContactListRouterProtocol {
    func navigateToDetail(contact: Contact)
}
