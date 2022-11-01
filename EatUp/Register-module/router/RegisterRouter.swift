//
//  RegisterRouter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule(ref: Register) {
        ref.registerPresenterObject = RegisterPresenter()
        ref.registerPresenterObject?.registerInteractor = RegisterInteractor()
    }
}
