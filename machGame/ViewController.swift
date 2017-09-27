//
//  ViewController.swift
//  machGame
//
//  Created by eleves on 17-09-27.
//  Copyright © 2017 eleves. All rights reserved.
//
//======================================================
import UIKit
//----------------
class ViewController: UIViewController {

//----------------
    @IBOutlet weak var viewBack_01: UIView!
    @IBOutlet weak var viewFront_01: UIView!
    @IBOutlet weak var viewBack_02: UIView!
    @IBOutlet weak var viewFront_02: UIView!

    @IBOutlet weak var animalView01: UIImageView!
    @IBOutlet weak var animalView02: UIImageView!
    
    var arrayOfImagesViews: [UIImageView]!
    var arrayOfAnimalNames: [String] = ["burro.png", "touro.png"]
    var arrayOfRandomAnimalNames = [String] ()
    var arrayChosenCards = [String] ()
    
//----------------
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfImagesViews = [animalView01, animalView02]
        randomAnimalNames()
        setImagesToCard()
    }
//----------------
    @IBAction func showCard(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            flipCard(from: viewFront_01, to: viewBack_01)
        case 1:
            flipCard(from: viewFront_02, to: viewBack_02)
        default:
            break
        }
    }
//----------------
    func flipCard(from: UIView, to: UIView){
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        
        UIView.transition(with: from, duration: 1.0, options: transitionOptions, animations: {from.isHidden = true})
        
        UIView.transition(with: to, duration: 1.0, options: transitionOptions, animations: {to.isHidden = false})
    }
//----------------
    func setImagesToCard(){
        var number = 0
        for imgView in arrayOfImagesViews{
            imgView.image = UIImage(named: arrayOfRandomAnimalNames[number])
            number = number + 1
        }
    }
//----------------
    func randomAnimalNames(){
        let numberOfAnimals = arrayOfAnimalNames.count
        
        // Repetition entre 0 et 3
        for _ in 1...numberOfAnimals {
            let randomNumber = Int(arc4random_uniform(UInt32(arrayOfAnimalNames.count)))
            arrayOfRandomAnimalNames.append(arrayOfAnimalNames[randomNumber])
            arrayOfAnimalNames.remove(at: randomNumber)
        }
    }
//----------------
    
    
}
//======================================================
