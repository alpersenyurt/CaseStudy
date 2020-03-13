//
//  CommentModel.swift
//  CaseStudy
//
//  Created by Alper Senyurt on 3/10/20.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

struct CommentModel: Codable,Equatable {
    let averageRating:Int
    let anonymousCommentsCount:Int
    let memberCommentsCount:Int
}
