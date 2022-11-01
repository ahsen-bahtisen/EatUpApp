//
//  Protocols.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

protocol ViewToPresenterLoginPageProtocol {
    
    var loginPageInteractor : PresenterToInteractorLoginPageProtocol? {get set}
    func loginAll(email: String, password: String)
}

protocol PresenterToInteractorLoginPageProtocol {
    func login(email: String, password: String)
}


protocol PresenterToRouterLoginPage{
    static func createModule(ref: LoginPage)
}
