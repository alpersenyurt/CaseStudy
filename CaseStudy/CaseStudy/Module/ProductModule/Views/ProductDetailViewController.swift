//
//  ProductDetailViewController.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController, ProductDetailViewInput {
    
    @IBOutlet weak var mainStackView: UIStackView!
    var presenter: ProductDetailPresenterInput?
    var productImageViewController:ProductImageViewController?
    var productViewController:ProductViewController?

    override func viewDidLoad() {
          super.viewDidLoad()
        self.productImageViewController = self.presenter?.loadProducImageViewController()
        self.productViewController = self.presenter?.loadProductChildViewController()
        self.addNewChildVCStackView(self.productImageViewController)
        self.addNewChildVCStackView(self.productViewController)
        self.presenter?.viewDidLoad()
      
    }
    
    // update the view state
    func applyNewStateForViews(state: StateType) {
        self.productViewController?.state = state
        self.productImageViewController?.state = state
    }
    
    func addNewChildVCStackView(_ viewController: UIViewController?) {
        if let viewController = viewController {
            self.addChild(viewController)
            mainStackView.addArrangedSubview(viewController.view)
            viewController.didMove(toParent: self)
        }
    }
    
    func updateSocialInfo(likeCount: Int, rating: Double, totalCommentCountString: String) {
        self.productViewController?.updateProductFeature(rating: rating, commentCountString: totalCommentCountString, likeCount: likeCount)
    }
    
    func updateProduct(name: String, desc: String, imageStringUrl: String, priceString: String) {
        
        if  let url = URL(string: imageStringUrl) {
            self.productImageViewController?.updateImageView(for: url)
        }else {
            self.productImageViewController?.state = .error(ProductError.productImageNotLoadedError)
        }
        self.productViewController?.updateProductInfo(name: name, desc: desc, priceString: priceString)
    }
    
    func updateProductViewCounter(counter: Int, progress: Double, hide:Bool) {
        self.productViewController?.updateCounterTimerLabel(progress: progress, count: counter, isHidden: hide)
    }

}
