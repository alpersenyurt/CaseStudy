//
//  ProductImageViewController.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import UIKit
import Kingfisher

class ProductImageViewController: UIViewController, StatePresenter {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateImageView(for url: URL) {
        imageView.kf.setImage(with: url)
    }

    // Product Image View Controller is comformed StatePresenter protocol to mananage its state
    var state: StateType = .success {
          didSet {
              render()
          }
    }
    
    // StatePresenter, ErrorPresenter  method is overried because no need to handle error show any message for image, we can show placeholder
    func present(_ error: Error) {
        self.imageView.image = UIImage(named: "placeholder")
    }
}
