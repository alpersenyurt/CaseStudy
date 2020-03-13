//
//  ProductViewController.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import UIKit
import CircleProgressView
import Cosmos

class ProductViewController: UIViewController, StatePresenter {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var circleProgressView: CircleProgressView!
    @IBOutlet weak var timerProgressLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var reviewRatingLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateProductInfo(name:String, desc:String, priceString:String) {
        self.state = .success
        self.productNameLabel.text = name
        self.productDescLabel.text = desc
        self.priceLabel.text = priceString
    }

    func updateCounterTimerLabel(progress:Double, count: Int, isHidden: Bool = false) {
        self.timerProgressLabel.text = "\(count)"
        self.circleProgressView.setProgress(progress, animated: true)
        self.circleProgressView.isHidden = isHidden

    }
    
    func updateProductFeature(rating: Double, commentCountString: String, likeCount: Int) {
        self.reviewRatingLabel.text = "\(rating)"
        self.commentCountLabel.text = commentCountString
        self.likeCountLabel.text = "\(likeCount)"
        self.ratingView.rating = rating
    }

    // Product View Controller is comformed StatePresenter protocol to mananage its state
    var state: StateType = .success {
           didSet {
               render()
           }
    }
}
