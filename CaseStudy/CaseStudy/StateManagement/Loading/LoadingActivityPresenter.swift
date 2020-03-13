//
//  LoadingActivityPresenter.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
import UIKit

public protocol LoadingActivityPresenter {

    //show any indicatior view
    func presentActivityView()

    //dismiss the indicatior view which is added before
    func dismissActivityView()
}

extension LoadingActivityPresenter where Self: UIViewController {
    func presentActivityView() {
        if let activityIndicator = findActiveLoading() {
            activityIndicator.startAnimating()
        } else {
            let activityIndicator = UIActivityIndicatorView(style: .gray)
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)

            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
                ])
        }
    }

    func dismissActivityView() {
        findActiveLoading()?.stopAnimating()
    }

    func findActiveLoading() -> UIActivityIndicatorView? {
        return view.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
}
