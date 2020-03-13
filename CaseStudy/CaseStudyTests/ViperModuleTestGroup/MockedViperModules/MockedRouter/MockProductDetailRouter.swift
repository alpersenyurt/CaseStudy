//
//  MockProductDetailRouter.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 13.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

class MockProductDetailRouter: ProductDetailRouterInput {
    func createProductChildViewController() -> ProductViewController? {
    
        return ProductViewController()
    }
    
    func createProducImageViewController() -> ProductImageViewController? {
        return ProductImageViewController()
    }
    
    
}
