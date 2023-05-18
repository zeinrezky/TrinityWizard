//
//  ContactDetailPresenter.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

class ContactDetailPresenter: ContactDetailPresenterProtocol {
    
    weak var vc: ContactDetailViewProtocol?
    private let router: ContactDetailRouterProtocol?
    private let interactor: ContactDetailInteractorInputProtocol?
    
    init(interface: ContactDetailViewProtocol,
         interactor: ContactDetailInteractorInputProtocol,
         router: ContactDetailRouterProtocol) {
        self.vc = interface
        self.router = router
        self.interactor = interactor
    }
    
    func getContact() -> Contact? {
        interactor?.getContact()
    }
}

extension ContactDetailPresenter: ContactDetailInteractorOutputProtocol {
    
}
