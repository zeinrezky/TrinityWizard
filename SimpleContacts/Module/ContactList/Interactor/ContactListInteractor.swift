//
//  ContactListInteractor.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

class ContactListInteractor: ContactListInteractorInputProtocol {
    
    private var contact: [Contact] = []
    weak var output: ContactListInteractorOutputProtocol?
    
    init() {
        readDataFromJSON()
    }
    
    func getListContact() -> [Contact] {
        contact
    }
    
    func updateContact(newContact: Contact) {
        if let index = contact.firstIndex(where: { $0.id == newContact.id }) {
            contact[index] = newContact
            
            output?.didUpdateContact()
        }
    }
    
    private func readDataFromJSON() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            let people = try decoder.decode([Contact].self, from: jsonData)
            
            // Access the data
            var newContact: [Contact] = []
            for person in people {
                newContact.append(person)
            }
            
            contact = newContact
        } catch {
            print("Error reading JSON data:", error)
        }
    }
    
    func pullToRefresh() {
        readDataFromJSON()
        output?.didUpdateContact()
    }
    
    
}

