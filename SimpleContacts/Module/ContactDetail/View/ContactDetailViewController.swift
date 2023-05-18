//
//  ContactDetailViewController.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var DOBTextField: UITextField!
    
    var presenter: ContactDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        

        // Add a right bar button item
        let saveButton = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func setupView() {
        guard let contact = presenter?.getContact() else { return }
        
        firstNameTextField.text = contact.firstName
        lastNameTextField.text = contact.lastName
        emailTextField.text = contact.email
        DOBTextField.text = contact.dob
    }
    
    @objc func saveButtonTapped() {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let emailName = emailTextField.text
        let DOBName = DOBTextField.text
        
        let vc = navigationController?.viewControllers.first as? ContactListViewController
        vc?.presenter?.updateContact(contact: Contact(id: presenter?.getContact()?.id ?? "",
                                           firstName: firstName ?? "",
                                           lastName: lastName ?? "",
                                           email: emailName,
                                           dob: DOBName))
        navigationController?.popViewController(animated: true)
    }
    

}

extension ContactDetailViewController: ContactDetailViewProtocol {
    
}
