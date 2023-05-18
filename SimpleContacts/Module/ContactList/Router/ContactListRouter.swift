//
//  ContactListRouter.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

class ContactListRouter: ContactListRouterProtocol {
    weak var vc: ContactListViewController?
    
    func navigateToDetail(contact: Contact) {
        let detail = ModuleBuilder.shared.createContactDetailModule(contact: contact)
        vc?.navigationController?.pushViewController(detail, animated: true)
    }
}
