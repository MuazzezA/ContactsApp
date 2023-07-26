//
//  ContactDetailViewController.swift
//  ContactsApp
//
//  Created by Muazzez Aydın on 25.07.2023.
//

import UIKit

class ContactDetailViewController: UIViewController {
    
    var selectedPerson: PersonModel?
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var userTypeLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let img = selectedPerson?.gender.personGender {
        
            personImageView.image = UIImage(named: img.lowercased())
            userNameLabel.text = selectedPerson?.name
            userTypeLabel.text = selectedPerson?.personType.personType
            
            } else {
                   personImageView.image = UIImage(named: "noimage")
            }
            
    }
    
    private func getContactByType() -> [PersonModel] {
        return Contacts.contacts.filter({ $0.personType == selectedPerson?.personType })
    }
    

}
