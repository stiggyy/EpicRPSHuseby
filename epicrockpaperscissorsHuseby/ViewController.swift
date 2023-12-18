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

struct RPSchoice: Codable{
    var choseRock: Bool
    var chosePaper: Bool
    var choseScissors: Bool
    
}
class AppData: Codable {
    static var playerName = "Player"
    static var playable = false
    static var indexOne = 0
    static var indexTwo = 0
    static var playerChoosing = 1
    static var playerOneName = ""
    static var playerTwoName = ""
    static let defaults = UserDefaults.standard
    static var peopleArray = [person(name: "Player", wins: 0, losses: 0, ties: 0), person(name: "Computer", wins: 0, losses: 0, ties: 0)]
    
    static var index = 0
    
}

class ViewController: UIViewController {

    var playerwins = false
    var vswins = false
    var tie = false
  
    @IBOutlet weak var compchoiceLabel: UILabel!
    
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = AppData.defaults.data(forKey: "peopleSet") {
                        let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([person].self, from: items) {
                            AppData.peopleArray = decoded
                        }
            
                }
    }
    
    
    @IBAction func chosePaperAction(_ sender: Any) {
        
       
        let pRPS = RPSchoice(choseRock: false, chosePaper: true, choseScissors: false)
        
        let cRPS = chooseComp()
        
        
        
        
        if competeYay(player: pRPS, vs: cRPS){
            decideWhoWon()
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.peopleArray) {
                AppData.defaults.set(encoded, forKey: "peopleSet")
            }
        }
        
    }
    
    
    @IBAction func choseScissors(_ sender: Any) {
        let pRPS = RPSchoice(choseRock: false, chosePaper: false, choseScissors: true)
        
        let cRPS = chooseComp()
        
        
        
        
        if competeYay(player: pRPS, vs: cRPS){
            decideWhoWon()
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.peopleArray) {
                AppData.defaults.set(encoded, forKey: "peopleSet")
            }
        }
    }
    
    
    @IBAction func choseRock(_ sender: Any) {
        
        let pRPS = RPSchoice(choseRock: true, chosePaper: false, choseScissors: false)
        
        let cRPS = chooseComp()
        
        
        
        
        if competeYay(player: pRPS, vs: cRPS){
            decideWhoWon()
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(AppData.peopleArray) {
                AppData.defaults.set(encoded, forKey: "peopleSet")
            }
        }
    }
    

    func decideWhoWon(){
        
        var pin = 0
        for x in AppData.peopleArray{
            if x.name == AppData.playerName {
                break
            }
            pin = pin + 1
        }
        
        var cin = 0
        for x in AppData.peopleArray{
            if x.name == "Computer" {
                break
            }
            cin = cin + 1
        }
        if playerwins {
            AppData.peopleArray[pin].addWin()
            AppData.peopleArray[cin].addLoss()
            winnerLabel.text = "You won!"
        } else if vswins {
            AppData.peopleArray[cin].addWin()
            AppData.peopleArray[pin].addLoss()
            winnerLabel.text = "Computer won!"
        } else {
            AppData.peopleArray[pin].addTie()
            AppData.peopleArray[cin].addTie()
            winnerLabel.text = "Tie!"
        }
        
        
    }
    
    func chooseComp() -> RPSchoice{
        var paper: Bool = false
        var scissors: Bool = false
        var rock: Bool = false
        
        let yay = Int.random(in: 1...3)
        
        
        switch yay{
        case 1:
            paper = true
            compchoiceLabel.text = "Computer chose paper"
            
        case 2:
            scissors = true
            compchoiceLabel.text = "Computer chose scissors"
            
        case 3:
            rock = true
            compchoiceLabel.text = "Computer chose rock"
            
            
        default:
            
            print("help")



            
        }
        
        return RPSchoice(choseRock: rock, chosePaper: paper, choseScissors: scissors)
    }
    
    func competeYay( player: RPSchoice, vs: RPSchoice) -> Bool{
        
        if player.chosePaper {
            if vs.chosePaper {
                tie = true
                playerwins = false
                vswins = false
                return true
            }
            if vs.choseRock{
                playerwins = true
                vswins = false
                tie = false
                return true
            }
            if vs.choseScissors{
                vswins = true
                playerwins = false
                tie = false
                return true
            }
        } else if player.choseRock {
            
            if vs.choseRock{
                tie = true
                vswins = false
                playerwins = false
                return true
            }
            if vs.chosePaper {
                vswins = true
                playerwins = false
                tie = false
                return true
            }
            if vs.choseScissors{
                playerwins = true
                vswins = false
                tie = false
                return true
            }
        } else if player.choseScissors {
            if vs.chosePaper {
                playerwins = true
                vswins = false
                tie = false
                return true
            }
            if vs.choseRock {
                vswins = true
                playerwins = false
                tie = false
                return true
            }
            
            if vs.choseScissors {
                tie = true
                vswins = false
                playerwins = false
                return true
            }
        }
    return false
    
    }
    

}

