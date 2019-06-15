//
//  ViewController.swift
//  SwipeObservers
//
//  Created by Valeriy Pokatilo on 15/06/2019.
//  Copyright © 2019 Valeriy Pokatilo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObservers()
        tapObservers()
    }

    // Swipes
    func swipesObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:
            label.text = "Right swipe"
        case .left:
            label.text = "Left swipe"
        case .up:
            label.text = "Up swipe"
        case .down:
            label.text = "Down swipe"
        default:
            break
        }
    }
    
    // Taps
    func tapObservers() {
        let tripleTap = UITapGestureRecognizer(target: self, action:  #selector(trippleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action:  #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap) // игнорирование двойного тапа если тапаем трижды
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func trippleTapAction() {
        label.text = "Triple tap"
    }
    
    @objc func doubleTapAction() {
        label.text = "Double tap"
    }
    
}

