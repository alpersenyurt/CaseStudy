//
//  ErrorTypes.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

enum ProductError: LocalizedError {
    case productImageNotLoadedError
    case productInfoError
    case productSocialError

    var errorDescription: String? {
        switch self {
        case .productImageNotLoadedError:
            return "Product Image cant be loaded"
        case .productInfoError:
            return "Product Info cant be fetched"
        case .productSocialError:
            return "Product social info cant be fetched"
        }
    }
}
