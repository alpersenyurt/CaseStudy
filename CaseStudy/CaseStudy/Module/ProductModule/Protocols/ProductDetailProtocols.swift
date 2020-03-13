//
//  ProductDetailProtocols.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
import UIKit

// Presenter
protocol ProductDetailPresenterInput: class {
    var view: ProductDetailViewInput? { get set }
    var interactor: ProductDetailInteractorInput? { get set }
    var router: ProductDetailRouterInput? { get set }

    //product detail view is composed from two child view controllers
    func loadProductChildViewController() -> ProductViewController?
    func loadProducImageViewController() -> ProductImageViewController?

    //fetch entity models
    func fetchSocialData()
    func fetchProductData()

    //product detail viewdDidload is started
    func viewDidLoad()
}

// Interactor
protocol ProductDetailInteractorInput: class {
    var output: ProductDetailInteractorOutput? { get set }
    func getSocialData()
    func getProductData()
}

// Router
protocol ProductDetailRouterInput: class {
    func createProductChildViewController() -> ProductViewController?
    func createProducImageViewController() -> ProductImageViewController?
}

// View
protocol ProductDetailViewInput: class {
    func updateSocialInfo(likeCount: Int, rating: Double, totalCommentCountString: String)
    func updateProduct(name: String, desc: String, imageStringUrl: String, priceString: String)
    func updateProductViewCounter(counter: Int, progress: Double, hide:Bool)
    func applyNewStateForViews(state: StateType)
}

// interactor to presenter
protocol ProductDetailInteractorOutput: class {
    func socialDataFetchedSuccess(_ socialModel: SocialModel)
    func productDataFetchedSuccess(_ productModel: ProductModel)
    func socialDataFetchedFailure(_ error: Error)
    func productDataFetchedFailure(_ error: Error)
    func socialDataRequestTimerProvider(onProcess:TimeInterval, onProgress: Double, isFinished: Bool)
}
