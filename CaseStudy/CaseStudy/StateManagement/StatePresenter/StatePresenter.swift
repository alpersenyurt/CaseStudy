//
//  State.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

public enum StateType: Equatable {
    case loading 
    case success
    case error(Error)
    
    public static func == (lhs: StateType, rhs: StateType) -> Bool {
        switch (lhs, rhs) {
        case (let .error(lhsError), let .error(rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        case (success, success):
            return true
        case (loading, loading):
            return true
            
        default:
            return false
        }
    }
}

public protocol StatePresenter: LoadingActivityPresenter, ErrorPresenter {
    var state: StateType { get set }
    func render()
}

extension StatePresenter {
    func render() {
        switch state {
        case .loading:
            presentActivityView()
        case .error(let error):
            dismissActivityView()
            present(error)
        case .success:
            print("success")
            dismissActivityView()
        }
    }
}
