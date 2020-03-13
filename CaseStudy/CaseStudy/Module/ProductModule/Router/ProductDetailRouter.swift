//
//  ProductDetailRouter.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
import UIKit
class ProductDetailRouter: ProductDetailRouterInput {
    
    var viewController: ProductDetailViewController?

    func createProductChildViewController() -> ProductViewController? {
        let storyboard = UIStoryboard(name: "ProductView", bundle: nil)
        guard let view = storyboard.instantiateInitialViewController() as?
        ProductViewController else { return nil }
        return view
    }
    
    func createProducImageViewController() -> ProductImageViewController? {
        let storyboard = UIStoryboard(name: "ProductImageViewController", bundle: nil)
        guard let view = storyboard.instantiateInitialViewController() as?
        ProductImageViewController else { return nil }
        return view
    }
    
    static func createModule(using dependencies: ProductDetailDependencies) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "ProductDetail", bundle: nil)
        guard let view = storyboard.instantiateInitialViewController() as?
        ProductDetailViewController else { return UIViewController() }

        let router = ProductDetailRouter()
        let presenter = ProductDetailPresenter()
        let interactor = ProductDetailInteractor(dependencies: dependencies)
        view.presenter = presenter
        interactor.output = presenter
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        router.viewController = view

        return view
        
    }

}
