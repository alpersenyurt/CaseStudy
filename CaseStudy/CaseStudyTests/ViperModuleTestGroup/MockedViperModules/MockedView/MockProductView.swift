//
//  MockProductView.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 13.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

class MockProductView: ProductDetailViewInput {
    var viewState: StateType?
    var productViewLikeCount:Int = 0
    var productViewRating:Double = 0
    var productViewCommentLabelText:String = ""

    var productNameLabelText: String = ""
    var productDescLabelText: String = ""
    var productImageStringUrl: String = ""
    var productPriceString: String = ""
    
    func updateSocialInfo(likeCount: Int, rating: Double, totalCommentCountString: String) {
        self.productViewLikeCount  = likeCount
        self.productViewRating = rating
        self.productViewCommentLabelText = totalCommentCountString
    }
    
    func updateProduct(name: String, desc: String, imageStringUrl: String, priceString: String) {
        self.viewState = .success
        self.productNameLabelText = name
        self.productDescLabelText = desc
        self.productPriceString = priceString
        self.productImageStringUrl = imageStringUrl
    }
    
    func updateProductViewCounter(counter: Int, progress: Double, hide: Bool) {
        
    }
    
    func applyNewStateForViews(state: StateType) {
        self.viewState = state
    }
}
