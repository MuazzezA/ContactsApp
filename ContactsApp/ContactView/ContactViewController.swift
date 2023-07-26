//
//  ContactViewController.swift
//  ContactsApp
//
//  Created by Muazzez Aydın on 25.07.2023.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var contactTableView: UITableView!
    
    private var selectedPersonType: PersonType? {
        didSet{
            contactTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactTableView.delegate = self
        contactTableView.dataSource = self
        

        
        let filterButton = UIBarButtonItem(image: UIImage (systemName:
                                                            "line.3.horizontal.decrease.circle.fill"), style: .done, target: self, action:
        #selector (filterButtonAct))
        navigationItem.rightBarButtonItem = filterButton
        
    }
    

    @objc private func filterButtonAct () {
        let storyboard = UIStoryboard (name: "PickerViewController", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(identifier: "PickerViewController") as?
            PickerViewController {
            vc.delegate = self
            // çalışma yetkisi verir
            vc.modalPresentationStyle = .overCurrentContext
            self.present (vc, animated: true)
        }
        
    }

}

// picker delegate

extension ContactViewController: PickerViewControllerDelegate {
    func didSelectedPersonType(_ type: PersonType) {
        print(type)
        selectedPersonType = type
    }
}



// contact view delegate

extension ContactViewController : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return setSection().count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return setSection()[section].personType
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterContact(section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as! ContactTableViewCell
        
        cell.tableViewLabel.text = filterContact(indexPath.section)[indexPath.row].name
        cell.tableViewImage.image = UIImage(named: filterContact(indexPath.section)[indexPath.row].gender.personGender.lowercased())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        // detail geçiş buradan
        
        let selectedPerson = filterContact(indexPath.section)[indexPath.row]
        
       let storyboard = UIStoryboard(name: "ContactDetailViewController", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ContactDetailViewController") as? ContactDetailViewController {
            vc.selectedPerson = selectedPerson
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    private func setSection() -> [PersonType]{
        if let selectedPersonType {
            return [selectedPersonType]
        }
        else{
            return PersonType.allCases
        }
    }
    
    
    private func filterContact(_ sectionIndex: Int) -> [PersonModel] {
        
        if selectedPersonType == .allPersons { return Contacts.contacts}
        
        if selectedPersonType == nil {
            return Contacts.contacts.filter({ $0.personType == PersonType.allCases[sectionIndex] })
        }else{
            return Contacts.contacts.filter({ $0.personType == selectedPersonType })
            
        }
       

        
    }
}
