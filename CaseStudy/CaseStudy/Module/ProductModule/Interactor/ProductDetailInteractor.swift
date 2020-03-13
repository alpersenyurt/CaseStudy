//
//  ProductDetailInteractor.swift
//  CaseStudy
//
//  Created by ALPER SENYURT on 11.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import Foundation

typealias ProductDetailDependencies = HasProductDataProvider & HasSocialDataProvider & HasRepeatableTimerProvider

class ProductDetailInteractor: ProductDetailInteractorInput {
    
    //presenter
    weak var output: ProductDetailInteractorOutput?
   
    //dependencies
    let dependencies: ProductDetailDependencies
    
    //interactor gets its dependencies as a constructor injection
    init(dependencies: ProductDetailDependencies) {
        self.dependencies = dependencies
    }

    // Social info will be fetched again for every 60 seconds
    // Interactor communicates with timer provider and timer provider informs the interactor for every process and complation and interactor requests new social info data from its provider and new social data will be delivered to presenter to update the view
    func startTimer(for duration: TimeInterval = TimeInterval(60))  {
        self.dependencies.timerProvider.startTimer(seconds: duration, onProcess: { [weak self] interval in
            guard let self  = self else { return }
            let progress = interval / duration
            
            //inform the presenter about the progress of counter
            self.output?.socialDataRequestTimerProvider(onProcess: interval, onProgress: progress, isFinished: false)
            
        }, onComplated: { [weak self] in
            guard let self  = self else { return }
            
            //inform the presenter that 60 seconds counter is finished
            self.output?.socialDataRequestTimerProvider(onProcess: 0, onProgress: 1.0, isFinished: true)
            
            //counter is finished , request new social info data from provider
            self.getSocialData()
        })
    }
    
    // request social info from the provider
    // after social info is fetched successfull, start the timer to fetch new social info model
    func getSocialData() {
        self.dependencies.socialDataProvider.fetchSocialData { [weak self] socialResult in
            guard let self = self else { return }
            switch socialResult {
            case .success(let socialModel):
                self.output?.socialDataFetchedSuccess(socialModel)
                self.startTimer()
            case .failure(let error):
                self.output?.socialDataFetchedFailure(error)
            }
        }
    }
    
    // request product info from the provider
    func getProductData() {
        self.dependencies.productDataProvider.fetchProductData { [weak self] productResult in
            guard let self = self else { return }
            switch productResult {
            case .success(let productModel):
                self.output?.productDataFetchedSuccess(productModel)
            case .failure(let error):
                self.output?.productDataFetchedFailure(error)
            }
        }
    }
}
