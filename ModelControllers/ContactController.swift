//
//  ContactController.swift
//  Journal2
//
//  Created by Carson Buckley on 3/7/19.
//  Copyright © 2019 HyperBlock. All rights reserved.
//

import Foundation

class ContactController {
    
    //Singleton / Shared Instance
    static let shared = ContactController()
    
    //Source of Truth <<<--------------------<<<--------------------<<<--------------------<<<--------------------<<<--------------------
    var contacts: [Contact] = []
    
    //MARK: - CRUD
    
    //Create
    func createContact(firstName: String, lastName: String) {
        let contact = Contact(firstName: firstName, lastName: lastName)
        contacts.append(contact)
        //Save function here
        saveToPersistentStore()
    }
    //Read
    
    //Update
    func updateContact(contactToUpdate: Contact, newFirstName: String, newLastName: String) {
        contactToUpdate.firstName = newFirstName
        contactToUpdate.lastName = newLastName
        
    }
    
    //Delete
    func deleteContact(contactToDelete: Contact) {
        //Find Index of Contact in the Source of Truth
        guard let index = contacts.index(of: contactToDelete) else { return }
        
        //Remove at that index
        contacts.remove(at: index)
        
        //Save changes
        saveToPersistentStore()
        
        
    }
    
    //MARK: - Persistence
    //Create File URL
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "contacts.json"
        let fullURL = documentDirectory.appendingPathComponent(fileName)
        return fullURL
        
    }
    
    //Save
    func saveToPersistentStore() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(contacts)
            print(data)
            try data.write(to: fileURL())
            
        } catch {
            print("There was an error saving Saving to Persistent Store \(error) \(error.localizedDescription)")
        }
        
    }
    
    //Load
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: fileURL())
            let decoder = JSONDecoder()
            let contacts = try decoder.decode([Contact].self, from: data)
            self.contacts = contacts
        } catch {
            print("There was an error loading from Persistent Store \(error) \(error.localizedDescription)")
        }
        
    }
    
}
