//
//  ModuleBuilder.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

class ModuleBuilder {
    
    static let shared = ModuleBuilder()
    
    private init() {}
    
    func createContactListModule() -> ContactListViewController {
        let vc = ContactListViewController()
        let router = ContactListRouter()
        let interactor = ContactListInteractor()
        let presenter = ContactListPresenter(interface: vc,
                                             interactor: interactor,
                                             router: router)
        vc.presenter = presenter
        router.vc = vc
        interactor.output = presenter
        return vc
    }
    
    func createContactDetailModule(contact: Contact) -> ContactDetailViewController {
        let vc = ContactDetailViewController()
        let router = ContactDetailRouter()
        let interactor = ContactDetailInteractor(contact: contact)
        let presenter = ContactDetailPresenter(interface: vc,
                                               interactor: interactor,
                                               router: router)
        vc.presenter = presenter
        router.vc = vc
        interactor.output = presenter
        return vc
    }
}
