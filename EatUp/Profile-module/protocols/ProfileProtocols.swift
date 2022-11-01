//
//  ProfileProtocols.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 31.10.2022.
//

import Foundation

protocol ViewToPresenterProfileProtocol
{
    var profileInteractor : PresenterToInteractorProfileProtocol? {get set}
    var profileView : PresenterToViewProfileProtocol? {get set}
    
    func showInfoAll()
}

protocol PresenterToInteractorProfileProtocol
{
    var profilePresenter : InteractorToPresenterProfileProtocol? {get set}
    
    func showInfo()
}

protocol InteractorToPresenterProfileProtocol
{
    func sendDataToPresenter(email : String)
}

protocol PresenterToViewProfileProtocol
{
    func sendDataToView(email : String)
}

protocol PresenterToRouterProfileProtocol
{
    static func createModule(ref: ProfileVC)
}
