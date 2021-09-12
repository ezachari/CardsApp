//
//  CardSelectionVC.swift
//  CardsApp
//
//  Created by Юрий Ни on 12.09.2021.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    let cards = Cards.allValues
    
    var timer: Timer!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
        cardImageView.layer.borderWidth = 3
        cardImageView.layer.cornerRadius = 8
        cardImageView.layer.borderColor = CGColor(red: 0,
                                                  green: 0,
                                                  blue: 0,
                                                  alpha: 1)
        startTimer()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1,
                                     target: self,
                                     selector: #selector(showRandomImage),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "D2")
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
