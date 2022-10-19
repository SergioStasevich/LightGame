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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func pressButton(_ sender: UIButton) {
        sender.isHidden = true
    }
    
    
}
