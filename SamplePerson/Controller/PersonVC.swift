//
//  PersonVC.swift
//  SamplePerson
//
//  Created by Bernard Rayoso on 01/08/2018.
//  Copyright © 2018 bernardr. All rights reserved.
//

import UIKit

class PersonVC: UITableViewController {
    
    // MARK: - INITIALIZATION
    
    // URL TO FETCH
    let FETCH_URL = "https://philequity-dev.dvrse.net/wp-json/wp/v2/person/";
    
    var personList = [Persons]()
    var cache = NSCache<AnyObject, AnyObject>()
    var NewData = Data()
    
    
    // MARK: - Network Fetch URL
    
    func getJsonObject(completed: @escaping () -> ()){
        guard let url = URL(string: FETCH_URL) else { return }
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        
        let session = URLSession(configuration: config)
        
        if let thisData = self.cache.object(forKey: url as AnyObject) {
            
            NewData = thisData as! Data
            
            print("data is cache");
            
            URLSession.shared.dataTask(with: url) { (NewData, response, error) in
                
                
                if error == nil {
                    
                    self.cache.setObject(self.NewData as AnyObject, forKey: url as AnyObject)
                    
                    do {
                        
                        guard let jsonResponse = try JSONSerialization.jsonObject(with: NewData!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String : Any]]
                            
                            else {return}
                        
                        guard let jsonArray = jsonResponse as? [[String: Any]] else {
                            return
                        }
                        
                        
                        for contact in jsonArray {
                            
                            self.personList.append(Persons(json: contact));
                        }
                        DispatchQueue.main.async {
                            completed()
                        }
                        
                    }
                        // catch error
                    catch let error {
                        print("Error serializing json:", error)
                        
                    }
                    
                }
                
                
                }.resume()
            
            
            
            
            
            
        }
            
        else {
            
             print("data is downloaded");
            
            session.dataTask(with: url) { (data, response, error) in
                
                
                if error == nil {
                    
                    self.cache.setObject(data as AnyObject, forKey: url as AnyObject)
                    
                    do {
                        
                        guard let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String : Any]]
                            
                            else {return}
                        
                        guard let jsonArray = jsonResponse as? [[String: Any]] else {
                            return
                        }
                        
                        
                        for contact in jsonArray {
                            
                            self.personList.append(Persons(json: contact));
                        }
                        DispatchQueue.main.async {
                            completed()
                        }
                        
                    }
                        // catch error
                    catch let error {
                        print("Error serializing json:", error)
                        
                    }
                    
                }
                
                
                }.resume()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:"PersonCell", bundle:nil), forCellReuseIdentifier: "customPersonCell")
        
        // Configure Table
        configureTableView()
        
        getJsonObject {
            self.tableView.reloadData()
        }
        
        
        
    }
    
    
    func configureTableView() {
        tableView.rowHeight =  UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 204
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customPersonCell", for: indexPath) as! PersonCell
        cell.setPerson(person: personList[indexPath.row])
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          performSegue(withIdentifier: "detailedPersonSegue", sender: personList[indexPath.row])
    }
    
    
  
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailedPersonSegue" {
            if let detailedVC = segue.destination as? PersonDetailedVC {
                
                if let persons = sender as? Persons {
                   detailedVC.personListDetailed = persons
                    
                }
            }
            
        }
    }
    
}

