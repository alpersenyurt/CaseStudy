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
        self.state = .loading
        imageView.kf.setImage(with: url) { result in
            switch result {
            case .success( _):
                self.state = .success
            case .failure(let error):
                self.state = .error(error)
            }
        }
        
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
