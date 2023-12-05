//
//  ViewController.swift
//  epicrockpaperscissorsHuseby
//
//  Created by CATHERINE HUSEBY on 12/4/23.
//

import UIKit


class person: Codable{
    var name: String
    var wins: Int
    var losses: Int
    var ties: Int
    
    init(name: String, wins: Int, losses: Int, ties: Int) {
        self.name = name
        self.wins = wins
        self.losses = losses
        self.ties = ties
    }
    
    func changeName(_ newname: String){
        name = newname
    }
    
    func addWin(){
        wins = wins + 1
    }
    
    func addLoss(){
        losses = losses + 1
    }
    
    func addTie(){
        ties = ties + 1
    }
}

struct RPSchoice{
    var choseRock: Bool
    var chosePaper: Bool
    var choseScissors: Bool
}
class AppData {
    static var peopleArray = [person(name: "Player", wins: 0, losses: 0, ties: 0), person(name: "Computer", wins: 0, losses: 0, ties: 0)]
    
}

class ViewController: UIViewController {

  //  @IBOutlet weak var paperoutlet: UIButton!
    
  //  @IBOutlet weak var scissoroutlet: UIButton!
    
      //  @IBOutlet weak var rockoutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       // scissoroutlet.currentImage = UIImage(named: "scissors")
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func chosePaperAction(_ sender: Any) {
        let pRPS = RPSchoice(choseRock: false, chosePaper: true, choseScissors: false)
        
        
        
    }
    

}

