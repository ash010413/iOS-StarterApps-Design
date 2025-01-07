//
//  ViewController.swift
//  Dicee-iOS13

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    let diceNumbers = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    var leftDiceNumber = 0
    var rightDiceNumber = 0

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        diceImageView1.image = diceNumbers.randomElement()
        diceImageView2.image = diceNumbers.randomElement()
    }
    
}

