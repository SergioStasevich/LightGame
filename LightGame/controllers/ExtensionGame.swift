//
//  ExtensionGame.swift
//  LightGame
//
//  Created by Siarhei Stasevich on 20/10/2022.
//

import Foundation



extension Int{
    func secondsToString() -> String{
        let minutes = self / 60
        let seconds = self % 60
        
        return String(format: "%d:%02d", minutes,seconds)
    }
}
