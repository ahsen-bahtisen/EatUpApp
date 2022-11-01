//
//  RegisterProtocols.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

protocol ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol? { get set }
    func registerAll(email: String, password: String)
}
protocol PresenterToInteractorRegisterProtocol {
    func register(email: String, password: String)
}
protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref: Register)
}
