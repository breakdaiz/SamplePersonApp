//
//  PersonCell.swift
//  SamplePerson
//
//  Created by Bernard Rayoso on 01/08/2018.
//  Copyright © 2018 bernardr. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet weak var lbl_Age: UILabel!
    @IBOutlet weak var lbl_Birthday: UILabel!
    @IBOutlet weak var lbl_lastName: UILabel!
    @IBOutlet weak var lbl_firstName: UILabel!
    @IBOutlet weak var lbl_email: UILabel!
    @IBOutlet weak var lbl_mobileNum: UILabel!
    @IBOutlet weak var lbl_Address: UILabel!
    @IBOutlet weak var lbl_CPerson: UILabel!
    @IBOutlet weak var lbl_CPAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPerson (person: Persons)
    {
        lbl_firstName.text = person.firstName
        lbl_lastName.text = person.lastName
        lbl_Birthday.text = person.birthDate
        lbl_Age.text =  String(getDate(dob: person.birthDate))
        lbl_email.text = person.email
        lbl_mobileNum.text = person.mobilePhone
        lbl_Address.text = person.address
        lbl_CPerson.text = person.contact_person
        lbl_CPAddress.text = person.contact_person_address
        

        
    }
    
    func getDate(dob:String ) -> Int {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: dob)!
        
        
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: date, to: now)
        let finalAge = ageComponents.year!
        
        
        return finalAge
        
    }
}
