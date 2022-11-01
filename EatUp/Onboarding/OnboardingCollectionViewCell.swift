//
//  OnboardingCollectionViewCell.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 21.10.2022.
//

import UIKit
import Lottie


class OnboardingCollectionViewCell: UICollectionViewCell {
   
 
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)

   
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var slideTitleLablel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    
    func setup(_ slide: OnboardingSlide){

        slideTitleLablel.text = slide.title
        slideDescriptionLabel.text = slide.description
        //animationView.animation = Animation.named(slide.animationName)
        
        let animation = Animation.named(slide.animationName)
        animationView.animation = animation
        animationView.loopMode = .loop
        
        
        if !animationView.isAnimationPlaying{
            animationView.play()
        }
    }
    }
    
   
