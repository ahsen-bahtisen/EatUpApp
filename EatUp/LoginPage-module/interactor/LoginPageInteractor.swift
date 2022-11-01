//
//  LoginPageInteractor.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation
import Firebase

class LoginPageInteractor : PresenterToInteractorLoginPageProtocol {
    
    func login(email: String, password: String) {
        
        let auth = Auth.auth()
        auth.signIn(withEmail: email, password: password) { authResult, error in }
            }
        }
