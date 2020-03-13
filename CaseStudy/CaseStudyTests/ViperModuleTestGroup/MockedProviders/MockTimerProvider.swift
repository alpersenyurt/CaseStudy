//
//  MockTimerProvider.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation
@testable import CaseStudy

class MockTimerProvider: TimerProviderProtocol {
    var timerIsStarted:Bool = false
    var syncReturnComplation: Bool = false

   
    func startTimer(seconds: Double, onProcess: ((TimeInterval) -> Void)?, onComplated: (() -> Void)?) {
        guard !timerIsStarted else { return }
        timerIsStarted = true
        
        if syncReturnComplation {
            onComplated?()
        }
    }
    
    func resetTimer() {
        timerIsStarted = false
        syncReturnComplation = false
    }
    
    func invalidateTimer() {
        
    }
    

}
