//
//  Contacts.swift
//  ContactsApp
//
//  Created by Muazzez Aydın on 25.07.2023.
//

import Foundation

struct PersonModel {
    var name: String
    var gender: PersonGender
    var personType: PersonType
}

enum PersonGender: CaseIterable {
    case man
    case woman
    
    var personGender: String{
        switch self {
        case .man :
            return "Man"
        case .woman :
            return "Woman"
        }
    }
}

//enum PersonImage:CaseIterable {
//    case man
//    case woman
//
//    var personImage: String {
//        switch self{
//        case .man :
//            return "man"
//        case .woman :
//            return "woman"
//        }
//    }
//}

enum PersonType: CaseIterable {
    case family
    case work
    case friends
    case allPersons
    
    
    var personType: String {
        switch self {
        case .family:
            return "Family"
        case .work:
            return "Work"
        case .friends:
            return "Friends"
        case .allPersons:
            return "All Persons"
        
        }
    }
   
}


struct Contacts {
    static let contacts: [PersonModel] = [
               PersonModel(name: "John Smith", gender: PersonGender.man, personType: .family),
               PersonModel(name: "Emily Johnson", gender: .woman, personType: .family),
               PersonModel(name: "Michael Brown", gender: .man, personType: .family),
               PersonModel(name: "Olivia Davis", gender: .woman, personType: .family),
               PersonModel(name: "James Wilson", gender: .man, personType: .family),
               PersonModel(name: "Sophia Martinez", gender: .woman, personType: .family),
               PersonModel(name: "Daniel Taylor", gender: .man, personType: .work),
               PersonModel(name: "Ava Lee", gender: .woman, personType: .work),
               PersonModel(name: "Ethan Clark", gender: .man, personType: .work),
               PersonModel(name: "Mia Scott", gender: .woman, personType: .work),
               PersonModel(name: "Matthew Miller", gender: .man, personType: .work),
               PersonModel(name: "Abigail Wilson", gender: .woman, personType: .work),
               PersonModel(name: "William Anderson", gender: .man, personType: .friends),
               PersonModel(name: "Emma Moore", gender: .woman, personType: .friends),
               PersonModel(name: "Alexander Hall", gender: .man, personType: .friends)
    ]
    
}
