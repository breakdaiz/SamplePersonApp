//
//  Person.swift
//  SamplePerson
//
//  Created by Bernard Rayoso on 01/08/2018.
//  Copyright © 2018 bernardr. All rights reserved.
//

import UIKit
import Foundation

class Persons  {
    
    
    let firstName : String
    let lastName : String
    let birthDate : String
    let age : Int
    let email : String
    let mobilePhone: String
    let address : String
    let contact_person: String
    let contact_person_address : String
    
   
    init(json : [String : Any]) {
        
        firstName = json["first_name"] as? String ?? ""
        lastName = json["last_name"] as? String ?? ""
        birthDate = json["birthday"] as? String ?? ""
        age = 0
        email = json["email_address"] as? String ?? ""
        mobilePhone = json["mobile_number"] as? String ?? ""
        address = json["address"] as? String ?? ""
        contact_person = json["contact_person"] as? String ?? ""
        contact_person_address = json["contact_person_address"] as? String ?? ""
 
        
    }
 
   

    
}


