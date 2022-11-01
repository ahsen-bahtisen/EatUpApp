//
//  HomePageRouter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 26.10.2022.
//

import Foundation


class HomePageRouter : PresenterToRouterHomePageProtocol {
    static func createModule(ref: HomePage) {
        let presenter = HomePagePresenter()
        
        //View
        ref.homePagePresenterObject = presenter
        //Presenter
        ref.homePagePresenterObject?.homePageInteractor = HomePageInteractor()
        ref.homePagePresenterObject?.homePageView = ref
        
        //Interactor
        ref.homePagePresenterObject?.homePageInteractor?.homePagePresenter = presenter
    }
}
