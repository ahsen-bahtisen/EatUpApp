//
//  ProfilePresenter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 31.10.2022.
//

import Foundation


class ProfilePresenter : ViewToPresenterProfileProtocol
{
    var profileView: PresenterToViewProfileProtocol?
    
    var profileInteractor: PresenterToInteractorProfileProtocol?
    
    func showInfoAll() {
        profileInteractor?.showInfo()
    }
    
    
}

extension ProfilePresenter : InteractorToPresenterProfileProtocol
{
    func sendDataToPresenter(email: String) {
        profileView?.sendDataToView(email: email)
    }

}
