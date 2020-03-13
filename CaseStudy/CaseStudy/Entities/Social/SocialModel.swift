//
//  SocialModel.swift
//  CaseStudy
//
//  Created by Alper Senyurt on 3/10/20.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

struct SocialModel: Codable,Equatable {
    let likeCount:Int
    let commentCounts: CommentModel
}

