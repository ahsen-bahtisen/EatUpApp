//
//  LoginPageRouter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class LoginPageRouter : PresenterToRouterLoginPage {
    
    static func createModule(ref: LoginPage) {
        
        ref.LoginPagePresenterObject = LoginPagePresenter()
        ref.LoginPagePresenterObject?.loginPageInteractor = LoginPageInteractor()
    }
}

