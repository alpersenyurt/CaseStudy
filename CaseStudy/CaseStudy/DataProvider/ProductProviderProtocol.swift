//
//  ProductProviderProtocol.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

protocol ProductProviderProtocol {
    func fetchProductData(complation: (Result<ProductModel,Error>) -> Void)
}

struct ProductProvider: ProductProviderProtocol {
    
    let fileProvider: FileProviderProtocol
    
    init(fileProvider:FileProviderProtocol = FileProviver()) {
        self.fileProvider = fileProvider
    }
    
    func fetchProductData(complation: (Result<ProductModel,Error>) -> Void) {
        let productResult: Result<ProductModel,Error> = self.fileProvider.extractModel(from: "product")
        complation(productResult)
    }
}
