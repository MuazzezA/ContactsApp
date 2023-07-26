//
//  PickerViewController.swift
//  ContactsApp
//
//  Created by Muazzez Aydın on 26.07.2023.
//

import UIKit


protocol PickerViewControllerDelegate {
    func didSelectedPersonType(_ type : PersonType )
}

extension PickerViewControllerDelegate{
    func didSelectedPersonType(_ type : PersonType ) { }
}


class PickerViewController: UIViewController {

    @IBOutlet weak var datePickerView: UIPickerView!
    
    private var selectedPersonType: PersonType?
    
    var delegate : PickerViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePickerView.delegate = self
        datePickerView.dataSource = self
    }
    
    
    @IBAction func cancelButtonAct(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    @IBAction func doneButtonAct(_ sender: UIButton) {
        delegate?.didSelectedPersonType(selectedPersonType ?? .allPersons)
        dismiss(animated: false)
    }
    
}


extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PersonType.allCases.count
    }
   
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PersonType.allCases[row].personType
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPersonType = PersonType.allCases[row]
    }
    
}
