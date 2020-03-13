//
//  Dependencies.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

struct Dependencies: HasSocialDataProvider, HasProductDataProvider, HasRepeatableTimerProvider {
   
    //timer provider provide us repeater with complation
    var timerProvider: TimerProviderProtocol
    
    //social data provider provide us social info model
    var socialDataProvider: SocialDataProviderProtocol

    //product data provider provide us product info model
    var productDataProvider: ProductProviderProtocol
    
    init(socialDataProvider:SocialDataProviderProtocol = SocialDataProvider(), productDataProvider:ProductProviderProtocol = ProductProvider(), timerProvider:TimerProviderProtocol = TimerProvider()) {
        self.socialDataProvider = socialDataProvider
        self.productDataProvider = productDataProvider
        self.timerProvider = timerProvider
    }
}
