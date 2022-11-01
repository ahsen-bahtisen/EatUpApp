//
//  Register.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import UIKit
import Lottie
import Firebase

class Register: UIViewController {

    
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var registerPresenterObject: ViewToPresenterRegisterProtocol?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottieAnimation()
        RegisterRouter.createModule(ref: self)
        
    }

    func lottieAnimation(){
        
        let animation = Animation.named("lf30_editor_0drwokeh")
        animationView.animation = animation
        animationView.loopMode = .loop
        
        if !animationView.isAnimationPlaying{
            animationView.play()
        }
    }

    @IBAction func signUpButton(_ sender: Any) {
        
        if let emailText = emailTextField.text, let passwordText = passwordTextField.text{
            registerPresenterObject?.registerAll(email: emailText, password: passwordText)
        }
        let alert = UIAlertController(title: "Hoşgeldiniz", message: "Kayıt başarıyla gerçekleşti.", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Tamam", style: .default)
        {
            action in
            
            self.performSegue(withIdentifier: "HomePage2", sender: nil)
        }
        
        alert.addAction(okayAction)
        self.present(alert, animated: true)
    }
    
}
