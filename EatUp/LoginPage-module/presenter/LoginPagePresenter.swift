//
//  LoginPagePresenter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class LoginPagePresenter: ViewToPresenterLoginPageProtocol {
    
    var loginPageInteractor: PresenterToInteractorLoginPageProtocol?
    
    func loginAll(email: String, password: String) {
        loginPageInteractor?.login(email: email, password: password)
    }
}
