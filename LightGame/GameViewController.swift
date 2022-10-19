//
//  GameViewController.swift
//  LightGame
//
//  Created by Siarhei Stasevich on 19/10/2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var labelStatusGame: UILabel!
    
    lazy var  game = Game(countItem: buttons.count)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen ()
       
    }
    

    @IBAction func pressButton(_ sender: UIButton) {
        sender.isHidden = true
    }
    
    
    private func setupScreen (){
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
    }
    
}
