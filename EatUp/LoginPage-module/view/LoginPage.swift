//
//  LoginPage.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import UIKit
import Lottie
import Firebase
 
class LoginPage: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var LoginPagePresenterObject : ViewToPresenterLoginPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginPageRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        lottieAnimation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        let username = Auth.auth().currentUser?.displayName
        print(username ?? "Kullancı adı alınamadı")
    }
    func lottieAnimation(){
        
        let animation = Animation.named("94380-unauthenticated-user")
        animationView.animation = animation
        animationView.loopMode = .loop

        if !animationView.isAnimationPlaying{
            animationView.play()
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }

        if password == "" || email == "" {
            let alert = UIAlertController(title: "Hata", message: "Email ve şifre boş olamaz.", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                self.navigationController?.popToRootViewController(animated: true)}
            alert.addAction(OKAction)
            self.present(alert, animated: true)
       }
  
        let auth = Auth.auth()
            if let emailText = emailTextField.text,
               let passwordText = passwordTextField.text {
                LoginPagePresenterObject?.loginAll(email: emailText, password: passwordText)
            }
        auth.addStateDidChangeListener(){ (auth,user) in
            if user != nil {
                print("Giriş Başarılı: " + (user?.email)! )
                self.performSegue(withIdentifier: "HomePage1", sender: nil)
            }else {
                //Logın error
                let alert = UIAlertController(title: "Hata", message: "Lütfen bilgileri doğru giriniz.", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                    self.navigationController?.popToRootViewController(animated: true)}
                alert.addAction(OKAction)
                self.present(alert, animated: true)
            }
        }
        
    }
    
}
