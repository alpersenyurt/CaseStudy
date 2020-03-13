//
//  MockSocialDataProvider.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

class MockSocialDataProvider: SocialDataProviderProtocol {
   
    var failureWithError:Error?
    var successWithSocialModel: SocialModel?
    
    func fetchSocialData(complation: (Result<SocialModel, Error>) -> Void) {
        
        if let error = failureWithError {
            complation(.failure(error))
        } else if let socialModel = successWithSocialModel {
            complation(.success(socialModel))
        }
    }
    
}
