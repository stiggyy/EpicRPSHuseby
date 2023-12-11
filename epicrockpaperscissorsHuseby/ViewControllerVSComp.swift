//
//  ViewControllerVSComp.swift
//  epicrockpaperscissorsHuseby
//
//  Created by CATHERINE HUSEBY on 12/4/23.
//

import UIKit

class ViewControllerVSHuman: UIViewController {
    
    var playerwins = false
    var vswins = false
    var tie = false
    
    var whichPlayer = 1
    
    var RPSp1 = RPSchoice(choseRock: false, chosePaper: false, choseScissors: false)
    
    var RPSp2 = RPSchoice(choseRock: false, chosePaper: false, choseScissors: false)
    
    @IBOutlet weak var playerOneOutlet: UILabel!
    
    @IBOutlet weak var playertwoOutlet: UILabel!
    
    
    @IBOutlet weak var playerChoiceOutlet: UILabel!
    
    
    @IBOutlet weak var playerOneChoseOutlet: UILabel!
    
    
    @IBOutlet weak var playerTwoChoseOutlet: UILabel!
    
    @IBOutlet weak var winnerOutlet: UILabel!
    
    
    @IBOutlet weak var paperOutlet: UIButton!
    
    
    @IBOutlet weak var scissorsOutlet: UIButton!
    
    @IBOutlet weak var rockOutlet: UIButton!
    
    
    @IBOutlet weak var newGameButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        playerOneOutlet.text = AppData.playerOneName
        playertwoOutlet.text = AppData.playerTwoName
        
        newGameButtonOutlet.isEnabled = false
        
        if AppData.playable {
            paperOutlet.isEnabled = true
            scissorsOutlet.isEnabled = true
            rockOutlet.isEnabled = true
        }
    }
    
    
    
    @IBAction func ChoosePlayerGoAction(_ sender: Any) {
        
        AppData.playerChoosing = 1
        performSegue(withIdentifier: "choosePlayer", sender: self)
    }
    
    
    
    @IBAction func player2action(_ sender: Any) {
        
        AppData.playerChoosing = 2
        performSegue(withIdentifier: "choosePlayer", sender: self)
        
        
    }
    
    
    @IBAction func chosePaperAction(_ sender: Any) {
        
        if whichPlayer == 1 {
            RPSp1.chosePaper = true
            playerChoiceOutlet.text = "Player Two's Choice:"
            playerOneChoseOutlet.text = "Player one chose: Paper"
            whichPlayer = 2
        } else if whichPlayer == 2 {
            RPSp2.chosePaper = true
            playerTwoChoseOutlet.text = "Player two chose: Paper"
            if competeYay(player: RPSp1, vs: RPSp2){
                decideWhoWon()
            }
            whichPlayer = 1
            prepareForNewGame()
        }
    }
    
    
    
    @IBAction func choseScissors(_ sender: Any) {
        
        if whichPlayer == 1 {
            RPSp1.choseScissors = true
            playerChoiceOutlet.text = "Player Two's Choice:"
            playerOneChoseOutlet.text = "Player one chose: Scissors"
            whichPlayer = 2
        } else if whichPlayer == 2 {
            RPSp2.choseScissors = true
            playerTwoChoseOutlet.text = "Player two chose: Scissors"
            if competeYay(player: RPSp1, vs: RPSp2){
                decideWhoWon()
            }
            whichPlayer = 1
            prepareForNewGame()
        }
    }
    
    
    @IBAction func choseRock(_ sender: Any) {
        
        if whichPlayer == 1 {
            RPSp1.choseRock = true
            playerChoiceOutlet.text = "Player Two's Choice:"
            playerOneChoseOutlet.text = "Player one chose: Rock"
            whichPlayer = 2
        } else if whichPlayer == 2 {
            RPSp2.choseRock = true
            playerTwoChoseOutlet.text = "Player two chose: Rock"
            if competeYay(player: RPSp1, vs: RPSp2){
                decideWhoWon()
            }
            whichPlayer = 1
            prepareForNewGame()
            
            
            
        }
    }
    
    
    @IBAction func newGameAction(_ sender: Any) {
        
        playerChoiceOutlet.text = "Player One's Choice:"
        playertwoOutlet.text = "Pick player two"
        playerOneOutlet.text = "Pick player one"
        
    }
    
    
    
    func prepareForNewGame(){
        paperOutlet.isEnabled = false
        scissorsOutlet.isEnabled = false
        rockOutlet.isEnabled = false
        newGameButtonOutlet.isEnabled = true
        AppData.playerChoosing = 1
        AppData.playable = false
        AppData.playerOneName = ""
        AppData.playerTwoName = ""
        AppData.indexOne = 0
        AppData.indexTwo = 0
    }
    
    func decideWhoWon(){
        if playerwins {
            AppData.peopleArray[AppData.indexOne].addWin()
            AppData.peopleArray[AppData.indexTwo].addLoss()
            winnerOutlet.text = "Player 1 won!"
        } else if vswins {
            AppData.peopleArray[AppData.indexTwo].addWin()
            AppData.peopleArray[AppData.indexOne].addLoss()
            winnerOutlet.text = "Player 2 won!"
        } else {
            AppData.peopleArray[AppData.indexTwo].addTie()
            AppData.peopleArray[AppData.indexOne].addTie()
            winnerOutlet.text = "Tie!"
        }
        playerChoiceOutlet.text = "Player ones choice:"
        RPSp1.choseRock = false
        RPSp1.chosePaper = false
        RPSp1.choseScissors = false
        RPSp2.chosePaper = false
        RPSp2.choseRock = false
        RPSp2.choseScissors = false
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(AppData.peopleArray) {
            AppData.defaults.set(encoded, forKey: "peopleSet")
        }
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
