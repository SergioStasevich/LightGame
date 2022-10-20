//
//  GameViewController.swift
//  LightGame
//
//  Created by Siarhei Stasevich on 19/10/2022.
//

import UIKit


class GameViewController: UIViewController {

    @IBOutlet weak var newGameButn: UIButton!
    @IBOutlet weak var nextDigit: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var timerGame: UILabel!
    @IBOutlet weak var labelStatusGame: UILabel!
    
    
    lazy var  game = Game(countItem: buttons.count, time: 30) {[weak self](status,time)  in
        guard let self = self else {return}
        self.timerGame.text = time.secondsToString()
        self.updateInfo(with: status)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScreen ()
    }

    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index: buttonIndex)
        updateUI()
    }

    
    @IBAction func newGameButton(_ sender: UIButton) {
        game.newGame()
        sender.isHidden = true
        setupScreen()
    }
    
    private func setupScreen (){
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].alpha = 1
            buttons[index].isEnabled = true
            
        }
        nextDigit.text = game.nextItem?.title
    }
    
    private func updateUI(){
        for index in game.items.indices {
            buttons[index].alpha = game.items[index].isFound ? 0 : 1
            buttons[index].isEnabled = !game.items[index].isFound
            if game.items[index].isError{
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.buttons[index].backgroundColor = .red
                } completion: {[weak self] _ in
                    self?.buttons[index].backgroundColor = .systemGray6
                    self?.game.items[index].isError = false
                }

            }
        }
        nextDigit.text = game.nextItem?.title
        updateInfo(with: game.status)
   
    }
    private func updateInfo(with status: StatusGame){
        switch status {
        case .start:
            labelStatusGame.text = "The game has begun"
            labelStatusGame.textColor = .black
            newGameButn.isHidden = true
        case .win:
            labelStatusGame.text = "You win!!"
            labelStatusGame.textColor = .green
            newGameButn.isHidden = false
        case .lose:
            labelStatusGame.text = "You lose!"
            labelStatusGame.textColor = .red
            newGameButn.isHidden = false
        }
    }
}
