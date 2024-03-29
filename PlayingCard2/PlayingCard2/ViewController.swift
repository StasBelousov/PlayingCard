//
//  ViewController.swift
//  PlayingCard2
//
//  Created by Станислав Белоусов on 21/05/2019.
//  Copyright © 2019 Станислав Белоусов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended: playingCardView.isFaceUp = !playingCardView.isFaceUp
        default: break
        }
    }
    
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right,.up,.down]
            playingCardView.addGestureRecognizer(swipe)
        }
    }
    @objc func nextCard() {
        if let card = deck.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

