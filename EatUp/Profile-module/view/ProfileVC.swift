//
//  ProfileVC.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 31.10.2022.
//

import UIKit
import Firebase


class ProfileVC: UIViewController {

    @IBOutlet weak var mailLabel:  UILabel!
    
    var profilePresenterObject : ViewToPresenterProfileProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profilePresenterObject?.showInfoAll()
    }
    
    @IBAction func singOutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            
            performSegue(withIdentifier: "toLoginVC", sender: nil)
        } catch  {
           
        }
    }
}


extension ProfileVC : PresenterToViewProfileProtocol
{
    func sendDataToView(email: String) {
        
        self.mailLabel.text = email
    }
    
}
