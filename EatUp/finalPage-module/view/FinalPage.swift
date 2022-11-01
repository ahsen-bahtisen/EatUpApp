//
//  FinalPage.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 28.10.2022.
//

import UIKit
import Firebase
import Lottie


class FinalPage: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lottieAnimation()
    }
    
    func lottieAnimation(){
        
        let animation = Animation.named("lf30_editor_x5kgpkf1")
        
        animationView.animation = animation
        //animationView.loopMode = .loop

        if !animationView.isAnimationPlaying{
            animationView.play()
        }
    }
    

    @IBAction func orderStatusButton(_ sender: Any) {
        performSegue(withIdentifier: "orderstatus", sender: nil)
    }
    
    
    @IBAction func toHomeButton(_ sender: Any) {
        performSegue(withIdentifier: "anasayfa", sender: nil)
    }
}
