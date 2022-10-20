//
//  GameViewController.swift
//  LightGame
//
//  Created by Siarhei Stasevich on 19/10/2022.
//

import UIKit

enum StatusGame{
    case start
    case win
}

class GameViewController: UIViewController {

    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var labelStatusGame: UILabel!
    
    
    lazy var  game = Game(countItem: buttons.count)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen ()
       
    }
    

    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index: buttonIndex)
        updateUI()
    }
    
    
    
    private func setupScreen (){
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        nextDigit.text = game.nextItem?.title
    }
    
    private func updateUI(){
        for index in game.items.indices {
            buttons[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
        
        if game.status == .win {
            labelStatusGame.text = "YOU WIN!!"
            labelStatusGame.backgroundColor = .green
    }
   
    }
}
