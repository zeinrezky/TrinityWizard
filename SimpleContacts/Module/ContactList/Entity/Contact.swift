//
//  Contact.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import Foundation

struct Contact: Codable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String?
    var dob: String?
}
