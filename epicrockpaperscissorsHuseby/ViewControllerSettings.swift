//
//  ViewControllerSettings.swift
//  epicrockpaperscissorsHuseby
//
//  Created by CATHERINE HUSEBY on 12/4/23.
//

import UIKit

class ViewControllerSettings: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(AppData.peopleArray[indexPath.row].name)"
        
        return cell
    }
    

    @IBOutlet weak var personOutlet: UITextField!
    
    
    @IBOutlet weak var nameOutlet: UITextField!
    
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func newPersonAction(_ sender: Any) {
        let name = personOutlet.text ?? "John Doe"
        
        
        AppData.peopleArray.append(person(name: name, wins: 0, losses: 0, ties: 0))
            
        
        
        tableViewOutlet.reloadData()
    }
    
    
    @IBAction func changeNameAction(_ sender: Any) {
        let name = nameOutlet.text
        
        if let x = name {
            AppData.peopleArray[0].changeName(x)
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.peopleArray) {
            AppData.defaults.set(encoded, forKey: "peopleSet")
        }
        tableViewOutlet.reloadData()
        
    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        
        AppData.peopleArray.removeAll()
        AppData.peopleArray.append(person(name: "Player", wins: 0, losses: 0, ties: 0))
        AppData.peopleArray.append(person(name: "Computer", wins: 0, losses: 0, ties: 0))
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.peopleArray) {
            AppData.defaults.set(encoded, forKey: "peopleSet")
        }
        tableViewOutlet.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
