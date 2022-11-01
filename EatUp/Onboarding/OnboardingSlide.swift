//
//  OnboardingSlide.swift
//  EatUp
//
//  Created by Ahsen Bahtışen on 19.10.2022.
//

import UIKit

struct OnboardingSlide{
    var title: String
    var description: String
    var animationName: String
    
    init(title: String, description: String, animationName: String) {
        self.title = title
        self.description = description
        self.animationName = animationName
    }
}
