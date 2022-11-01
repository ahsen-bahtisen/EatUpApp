//
//  ProfileRouter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 31.10.2022.
//

import Foundation

class ProfileRouter : PresenterToRouterProfileProtocol
{
    static func createModule(ref: ProfileVC) {
        
        let presenter = ProfilePresenter()
        ref.profilePresenterObject = presenter
        ref.profilePresenterObject?.profileInteractor = ProfileInteractor()
        ref.profilePresenterObject?.profileView = ref
        ref.profilePresenterObject?.profileInteractor?.profilePresenter = presenter
    }
    
}
