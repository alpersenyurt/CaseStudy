//
//  MockProductDataProvider.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

class MockProductDataProvider: ProductProviderProtocol {
   
    var failureWithError:Error?
    var successWithProductModel: ProductModel?
    
    func fetchProductData(complation: (Result<ProductModel,Error>) -> Void) {

        if let error = failureWithError {
            complation(.failure(error))
        } else if let productModel = successWithProductModel {
            complation(.success(productModel))
        }
    }
    
}
