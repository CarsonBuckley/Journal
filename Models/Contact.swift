//
//  Contact.swift
//  Journal2
//
//  Created by Carson Buckley on 3/7/19.
//  Copyright © 2019 HyperBlock. All rights reserved.
//

import Foundation

class Contact: Codable {
    
    var firstName: String
    var lastName: String
    let timeStamp: Date = Date()
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// An Extension to make a Class (Contact in this case) Equatable
extension Contact: Equatable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.timeStamp == rhs.timeStamp
    }
    
    
}
