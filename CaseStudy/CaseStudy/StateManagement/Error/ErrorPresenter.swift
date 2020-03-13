//
//  ErrorPresenter.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
import UIKit

public protocol ErrorPresenter {
    func present(_ error: Error)
}

extension ErrorPresenter where Self: UIViewController {
    func present(_ error: Error) {
        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
}
