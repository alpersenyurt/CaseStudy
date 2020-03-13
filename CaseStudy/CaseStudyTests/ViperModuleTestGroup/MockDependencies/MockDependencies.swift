//
//  MockDependencies.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

extension Dependencies {
    static var mocked:Dependencies {
        return Dependencies(socialDataProvider: MockSocialDataProvider(), productDataProvider: MockProductDataProvider(), timerProvider: MockTimerProvider())
    }
}
