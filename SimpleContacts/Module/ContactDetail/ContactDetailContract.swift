//
//  ContactDetailContract.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

protocol ContactDetailPresenterProtocol: AnyObject {
    func getContact() -> Contact?
}

protocol ContactDetailViewProtocol: AnyObject {
}

protocol ContactDetailInteractorInputProtocol: AnyObject {
    func getContact() -> Contact?
}

protocol ContactDetailInteractorOutputProtocol: AnyObject {
}

protocol ContactDetailRouterProtocol {
}
