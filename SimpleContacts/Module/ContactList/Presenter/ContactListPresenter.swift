//
//  ContactListPresenter.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

class ContactListPresenter: ContactListPresenterProtocol {
    
    weak var vc: ContactListViewProtocol?
    private let router: ContactListRouterProtocol?
    private let interactor: ContactListInteractorInputProtocol?
    
    init(interface: ContactListViewProtocol,
         interactor: ContactListInteractorInputProtocol,
         router: ContactListRouterProtocol) {
        self.vc = interface
        self.router = router
        self.interactor = interactor
    }
    
    func getListContact() -> [Contact] {
        interactor?.getListContact() ?? []
    }
    
    func navigateToDetail(contact: Contact) {
        router?.navigateToDetail(contact: contact)
    }
    
    func updateContact(contact: Contact) {
        interactor?.updateContact(newContact: contact)
    }
    
    func pullToRefresh() {
        interactor?.pullToRefresh()
    }
}

extension ContactListPresenter: ContactListInteractorOutputProtocol {
    func didUpdateContact() {
        vc?.refreshCollection()
    }
}
