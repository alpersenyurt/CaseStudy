//
//  ProductModel.swift
//  CaseStudy
//
//  Created by Alper Senyurt on 3/10/20.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

struct ProductModel: Codable {    
    let pid: Int
    let name: String
    let desc: String
    let imageUrlString: String
    let priceModel: PriceModel

    enum CodingKeys: String, CodingKey {
        case pid = "id"
        case name
        case desc
        case imageUrlString = "image"
        case priceModel = "price"

    }
}
