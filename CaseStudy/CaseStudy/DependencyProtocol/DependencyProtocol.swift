//
//  DependencyProtocol.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

protocol HasProductDataProvider {
    var productDataProvider: ProductProviderProtocol { get }
}

protocol HasSocialDataProvider {
    var socialDataProvider: SocialDataProviderProtocol { get }
}

protocol HasRepeatableTimerProvider {
    var timerProvider: TimerProviderProtocol { get }
}
