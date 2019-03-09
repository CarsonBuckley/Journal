//
//  ContactDetailViewController.swift
//  Journal2
//
//  Created by Carson Buckley on 3/7/19.
//  Copyright © 2019 HyperBlock. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    
    
    //Landing Pad
    var selectedContact: Contact?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextFields()
        // Do any additional setup after loading the view.
    }
    
    
    func updateTextFields() {
        
        if let unwrappedContact = selectedContact {
            
            firstNameTextfield.text = unwrappedContact.firstName
            lastNameTextfield.text = unwrappedContact.lastName
            
        }
    }
    
        // MARK: - Navigation
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        // guard let: checking to make sure the title is there, if its not -> return. If it is, keep moving through the function, and I can use title now as a non-optional string
        //Find out if edit or add
        guard let firstName = firstNameTextfield.text,
            let lastName = lastNameTextfield.text else { return }
        
        
        if let unwrappedContact = selectedContact {
        
        //EDIT HERE
        ContactController.shared.updateContact(contactToUpdate: unwrappedContact, newFirstName: firstName, newLastName: lastName)
        
        } else {
            //ADD A NEW ONE
            ContactController.shared.createContact(firstName: firstName, lastName: lastName)
    }
        navigationController?.popViewController(animated: true)
}
}
