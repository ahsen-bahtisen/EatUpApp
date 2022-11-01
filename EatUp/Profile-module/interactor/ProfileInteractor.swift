//
//  ProfileInteractor.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 31.10.2022.
//

import Foundation
import Firebase

class ProfileInteractor : PresenterToInteractorProfileProtocol
{
    var profilePresenter: InteractorToPresenterProfileProtocol?
    
    func showInfo() {
        let auth = Auth.auth()
        
        let email = (auth.currentUser?.email)!
      
        profilePresenter?.sendDataToPresenter(email: email)
    }
    
}
