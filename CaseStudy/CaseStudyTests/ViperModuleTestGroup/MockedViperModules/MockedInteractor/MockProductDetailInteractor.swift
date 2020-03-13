//
//  MockProductDetailInteractor.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 13.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

class MockProductDetailInteractor: ProductDetailInteractorInput {
   
    var processProductDataLoadingState: Bool = false
    weak var output: ProductDetailInteractorOutput?
    var socialModel: SocialModel?
    var productModel: ProductModel?
    var failureProductError: Error?
    
    func getSocialData() {
        if let socialModel = socialModel {
            output?.socialDataFetchedSuccess(socialModel)
        }
    }
    
    func getProductData() {
        guard !processProductDataLoadingState else { return }
    
        if let productModel = productModel {
            output?.productDataFetchedSuccess(productModel)
        } else if let error = failureProductError {
            output?.productDataFetchedFailure(error)
        }
        
    }
    
    
}
