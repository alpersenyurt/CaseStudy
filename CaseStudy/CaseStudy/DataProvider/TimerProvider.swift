//
//  TimerProvider.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

protocol TimerProviderProtocol {
    
    func startTimer(seconds: Double, onProcess:((TimeInterval) -> Void)?, onComplated: (() -> Void)?)
    func resetTimer()
    func invalidateTimer()
}


class TimerProvider: TimerProviderProtocol {
    
    private var timer: Timer?
    private let timerIntervalInSeconds = TimeInterval(1)
    private(set) var durationInSeconds: TimeInterval = 0
    private(set) var totalDurationInSeconds: TimeInterval = 0
    
    func startTimer(seconds: Double, onProcess:((TimeInterval) -> Void)?, onComplated: (() -> Void)?) {
        guard timer == nil else { return }
        durationInSeconds = TimeInterval(seconds)
        self.totalDurationInSeconds = durationInSeconds
        timer = Timer.scheduledTimer(withTimeInterval: timerIntervalInSeconds, repeats: true, block: { [unowned self] _ in
            self.durationInSeconds -= 1
            onProcess?(self.durationInSeconds)
            if self.durationInSeconds <= 0 {
                onComplated?()
                self.resetTimer()
                
            }
        })
    }
        
    func resetTimer() {
        durationInSeconds = self.totalDurationInSeconds
    }
    
    func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    var isValid: Bool {
        return timer?.isValid ?? false
    }
}
