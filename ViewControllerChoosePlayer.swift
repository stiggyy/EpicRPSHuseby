//
//  ViewControllerChoosePlayer.swift
//  epicrockpaperscissorsHuseby
//
//  Created by CATHERINE HUSEBY on 12/7/23.
//

import UIKit

class ViewControllerChoosePlayer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    var peopleNoComputer = AppData.peopleArray
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
      //  peopleNoComputer.remove(at: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var y = 0
        peopleNoComputer = AppData.peopleArray
        
        for x in peopleNoComputer {
            
            if x.name == "Computer" {
                break
            } else {
                y = y + 1
            }
            
        }
        peopleNoComputer.remove(at: y)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleNoComputer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = "\(peopleNoComputer[indexPath.row].name)"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var i = 0
        for x in peopleNoComputer{
            if x.name == AppData.peopleArray[indexPath.row].name {
                break
            }
            i = i + 1
            
        }
        AppData.index = i
        
        if AppData.playerChoosing == 1 {
            AppData.playerOneName = AppData.peopleArray[i].name
            AppData.indexOne = i
            
        } else {
            AppData.playerTwoName = AppData.peopleArray[i].name
            AppData.indexTwo = i
            
            AppData.playable = true
            
            AppData.playerChoosing = 1
        }
        
        performSegue(withIdentifier: "goBack", sender: self)
       // AppData.index = indexPath.row
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
