//
//  PersonDetailedVC.swift
//  SamplePerson
//
//  Created by Bernard Rayoso on 01/08/2018.
//  Copyright © 2018 bernardr. All rights reserved.
//

import UIKit

class PersonDetailedVC: UIViewController {
    
    var personListDetailed : Persons?
    
    @IBOutlet weak var detailFirstName: UILabel!
    @IBOutlet weak var detailedLastName: UILabel!
    @IBOutlet weak var detailedBdate: UILabel!
    @IBOutlet weak var detailedAge: UILabel!
    @IBOutlet weak var detailedEmail: UILabel!
    @IBOutlet weak var detailedMobileNumber: UILabel!
    @IBOutlet weak var detailedAddress: UILabel!
    @IBOutlet weak var detailedContactPerson: UILabel!
    @IBOutlet weak var detailedCPAddress: UILabel!
    
    var dateNow = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstName = personListDetailed?.firstName else { return }
        guard let lastName = personListDetailed?.lastName else { return }
        guard let birthDate = personListDetailed?.birthDate else { return }
        guard let email = personListDetailed?.email else { return }
        guard let mobilePhone = personListDetailed?.mobilePhone else { return }
        guard let address = personListDetailed?.address else { return }
        guard let contactPerson = personListDetailed?.contact_person else { return }
        guard let contactPersonAdd = personListDetailed?.contact_person_address else { return }
    
        let calculatedAge = getDate(dob: birthDate)
        let readableDate = changedDateFormat(dob: birthDate)
    
    
        
        detailFirstName.text = firstName
        detailedLastName.text = lastName
        detailedBdate.text = readableDate
        detailedAge.text = String(calculatedAge)
        detailedEmail.text = email
        detailedMobileNumber.text = mobilePhone
        detailedAddress.text = address
        detailedContactPerson.text = contactPerson
        detailedCPAddress.text = contactPersonAdd

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    func changedDateFormat(dob:String ) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: dob)!
        
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        let goodDate = dateFormatter.string(from: date)
        
        return goodDate
        
    }
    
   

}
