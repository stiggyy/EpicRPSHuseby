//
//  ViewControllerPersonScore.swift
//  epicrockpaperscissorsHuseby
//
//  Created by CATHERINE HUSEBY on 12/6/23.
//

import UIKit

class ViewControllerPersonScore: UIViewController {

    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var winsOutlet: UILabel!
   
    @IBOutlet weak var losesOutlet: UILabel!
    
    @IBOutlet weak var tiesOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameOutlet.text = "Name: \(AppData.peopleArray[AppData.index].name)"
        winsOutlet.text = "Wins: \(String(AppData.peopleArray[AppData.index].wins))"
        
                           losesOutlet.text = "Losses: \(String(AppData.peopleArray[AppData.index].losses))"
        
        tiesOutlet.text = "Ties: \(String(AppData.peopleArray[AppData.index].ties))"
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
