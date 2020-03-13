//
//  MockProductDetailInteractorOutput.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import XCTest
@testable import CaseStudy

class MockProductDetailInteractorOutput: ProductDetailInteractorOutput {
    
    var isSocialDataFetchedSuccess = false
    var isProductDataFetchedSuccess = false
    var fetchedProductModel: ProductModel?
    var fetchedSocialModel: SocialModel?
    var failureProductData: Error?
    var failuredSocialData: Error?
    var timerIsFinished = false

    
    func socialDataFetchedSuccess(_ socialModel: SocialModel) {
        self.isSocialDataFetchedSuccess = true
        self.fetchedSocialModel = socialModel
    }
    
    func productDataFetchedSuccess(_ productModel: ProductModel) {
        self.isProductDataFetchedSuccess = true
        self.fetchedProductModel = productModel
    }
    
    func socialDataFetchedFailure(_ error: Error) {
        self.isSocialDataFetchedSuccess = false
        self.failuredSocialData = error
    }
    
    func productDataFetchedFailure(_ error: Error) {
        self.isProductDataFetchedSuccess = false
        self.failureProductData = error
    }
    
    func socialDataRequestTimerProvider(onProcess: TimeInterval, onProgress: Double, isFinished: Bool) {
        timerIsFinished = isFinished
    }
    
    
}
