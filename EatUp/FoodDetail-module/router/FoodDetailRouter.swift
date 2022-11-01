//
//  FoodDetailRouter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class FoodDetailRouter : PresenterToRouterFoodDetailProtocol {
    static func createModule(ref: FoodDetailVC) {
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
    }
}
