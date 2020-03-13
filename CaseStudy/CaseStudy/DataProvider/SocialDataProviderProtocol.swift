//
//  SocialDataProviderProtocol.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

protocol SocialDataProviderProtocol {
    func fetchSocialData(complation: (Result<SocialModel,Error>) -> Void)
}

struct SocialDataProvider: SocialDataProviderProtocol {
    
    let fileProvider: FileProviderProtocol
    
    init(fileProvider:FileProviderProtocol = FileProviver()) {
        self.fileProvider = fileProvider
    }
    
    func fetchSocialData(complation: (Result<SocialModel,Error>) -> Void) {
        let socialResult: Result<SocialModel,Error> =  self.fileProvider.extractModel(from: "social")
        complation(socialResult)
    }
}
