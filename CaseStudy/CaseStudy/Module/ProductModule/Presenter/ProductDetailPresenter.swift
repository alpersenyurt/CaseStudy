//
//  ProductDetailPresenter.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

class ProductDetailPresenter: ProductDetailPresenterInput {
    weak var view: ProductDetailViewInput?
    var interactor: ProductDetailInteractorInput?
    var router: ProductDetailRouterInput?
    
    // View is in viewdidload state
    func viewDidLoad() {
        //Loading State
        self.fetchProductData()
        self.fetchSocialData()
    }
    
    // request social info from interactor
    func fetchSocialData() {
        self.interactor?.getSocialData()
    }

    // request product info from interactor
    func fetchProductData() {
        self.view?.applyNewStateForViews(state: .loading)
        self.interactor?.getProductData()
    }
    
    // The product detail view is composed from two child view controller to be more extendable and manage the states easily
    // request the child view controller from router
    func loadProductChildViewController() -> ProductViewController? {
        return router?.createProductChildViewController()
    }
    func loadProducImageViewController() -> ProductImageViewController? {
        return router?.createProducImageViewController()
    }

}

extension ProductDetailPresenter: ProductDetailInteractorOutput {
   
    //update the social info values in the view
    func socialDataFetchedSuccess(_ socialModel: SocialModel) {
        let totalCommentString = "( \(socialModel.commentCounts.anonymousCommentsCount + socialModel.commentCounts.memberCommentsCount) Yorum)"
        self.view?.updateSocialInfo(likeCount: socialModel.likeCount, rating: Double(socialModel.commentCounts.averageRating), totalCommentCountString: totalCommentString)
    }
    
    //update the product info values in the view
    func productDataFetchedSuccess(_ productModel: ProductModel) {
        self.view?.applyNewStateForViews(state: .success)
        self.view?.updateProduct(name: productModel.name, desc: productModel.desc, imageStringUrl: productModel.imageUrlString, priceString: String(productModel.priceModel.value) + " " + productModel.priceModel.currency)
    }
    
    //Interactor lets us know about the progess of our counter
    // update the counter values in the view
    func socialDataRequestTimerProvider(onProcess:TimeInterval, onProgress: Double, isFinished: Bool) {
        self.view?.updateProductViewCounter(counter: Int(onProcess), progress: onProgress, hide: isFinished)
    }

    
    //error case important because product info is the most important thing in our app
    //if product can not be fetched successfully we should the update our view state with error and inform the user whats going on
    func productDataFetchedFailure(_ error: Error) {
        self.view?.applyNewStateForViews(state: .error(error))
    }
    
    //no need to handle if we have any product info
    func socialDataFetchedFailure(_ error: Error) {
        
    }
}
