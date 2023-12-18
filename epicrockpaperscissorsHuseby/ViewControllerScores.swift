//
//  ViewControllerScores.swift
//  epicrockpaperscissorsHuseby
//
//  Created by CATHERINE HUSEBY on 12/4/23.
//

import UIKit

class ViewControllerScores: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.peopleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(AppData.peopleArray[indexPath.row].name) - \(AppData.peopleArray[indexPath.row].wins) win(s)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toIndividualScore", sender: self)
        AppData.index = indexPath.row
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewOutlet.reloadData()
    }
    
    
    @IBAction func sortWinsAction(_ sender: Any) {
        //AppData.peopleArray = AppData.peopleArray.sorted(by: { $0.wins < $1.wins })
        
        AppData.peopleArray = AppData.peopleArray.sorted(by: { (a: person, b: person) -> Bool in
            return a.wins > b.wins
        })

      
        
        tableViewOutlet.reloadData()
    }
    

    @IBAction func sortByNameAction(_ sender: Any) {
        
        AppData.peopleArray = AppData.peopleArray.sorted(by: { (a: person, b: person) -> Bool in
            return a.name > b.name
        })

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
