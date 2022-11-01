//
//  RegisterPresenter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class RegisterPresenter : ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    func registerAll(email: String, password: String) {
        registerInteractor?.register(email: email, password: password)
    }
}
