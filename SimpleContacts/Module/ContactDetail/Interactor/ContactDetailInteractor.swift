//
//  ContactDetailInteractor.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

class ContactDetailInteractor: ContactDetailInteractorInputProtocol {
    private var contact: Contact
    
    weak var output: ContactDetailInteractorOutputProtocol?
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func getContact() -> Contact? {
        return contact
    }
    
}
