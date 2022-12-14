//
//  FoodDetailPresenter.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 27.10.2022.
//

import Foundation

class FoodDetailPresenter: ViewToPresenterFoodDetailProtocol {
    var foodDetailInteractor: PresenterToInteractorFoodDetailProtocol?
    
    func addAllFoodToCart(yemek_adi: String, yemek_fiyat: String, yemek_resim_adi: String, yemek_siparis_adet: String, kullanici_adi: String) {
        
        foodDetailInteractor?.addFoodToCart(yemek_adi: yemek_adi, yemek_fiyat: yemek_fiyat, yemek_resim_adi: yemek_resim_adi, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
            }
        }
