//
//  ProductDetailInteractorTest.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 12.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import XCTest
@testable import CaseStudy

class ProductDetailInteractorTest: XCTestCase {
    
    var sut: ProductDetailInteractor?
    var mockOutput: MockProductDetailInteractorOutput?
    var mockSocialDataProvider: MockSocialDataProvider?
    var mockProductDataProvider: MockProductDataProvider?
    var mockTimerDataProvider: MockTimerProvider?
    
    
    override func setUp() {
        let socialMockDataProvider = MockSocialDataProvider()
        let productMockDataProvider = MockProductDataProvider()
        let timerMockDataProvider = MockTimerProvider()
        self.mockSocialDataProvider = socialMockDataProvider
        self.mockProductDataProvider = productMockDataProvider
        self.mockTimerDataProvider = timerMockDataProvider
        
        sut = ProductDetailInteractor(dependencies: Dependencies(socialDataProvider: socialMockDataProvider, productDataProvider: productMockDataProvider, timerProvider: timerMockDataProvider))
        mockOutput = MockProductDetailInteractorOutput()
        sut?.output = mockOutput
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockOutput = nil
        super.tearDown()
    }
    
    
    // If we have any problem when social model is fetched, we test whether presenter will be informed or not about what the problem is
    func testWhenSocialDataProviderHasFailurePresenterIsInformed() {
        self.mockSocialDataProvider?.failureWithError = ProductError.productSocialError
        sut?.getSocialData()
        
        XCTAssertFalse(mockOutput!.isSocialDataFetchedSuccess)
        XCTAssertEqual(
            mockOutput!.failuredSocialData!.localizedDescription,
            ProductError.productSocialError.localizedDescription
        )
    }
    
    // If we have any problem when product model is fetched, we test whether presenter will be informed or not about what the problem is
    func testWhenProductDataProviderHasFailurePresenterIsInformed() {
        self.mockProductDataProvider?.failureWithError = ProductError.productInfoError
        sut?.getProductData()
        
        XCTAssertFalse(mockOutput!.isProductDataFetchedSuccess)
        XCTAssertEqual(
            mockOutput!.failureProductData!.localizedDescription,
            ProductError.productInfoError.localizedDescription
        )
    }
    
    //  We can check that interactor will call the presenter when product model is fetched successfully
    //  We can check that product model is returned to presenter is equal to fetched product model
    func testProductInfoDeliveredToPresenterSuccessfully() {
        let priceModel = PriceModel(value: 20, currency: "TR")
        let mockedProductModel = ProductModel(pid: 1, name: "TestProduct", desc: "Test", imageUrlString: "", priceModel: priceModel)
        self.mockProductDataProvider?.successWithProductModel = mockedProductModel
        
        sut?.getProductData()
        
        XCTAssertTrue(mockOutput!.isProductDataFetchedSuccess)
        XCTAssertEqual(mockOutput!.fetchedProductModel!.pid, mockedProductModel.pid)
    }
    
    //  We can check that interactar will call the presenter when social data is fetched successfully
    //  We can check that social model is returned to presenter is equal to fetched social model
    func testSocialModelDeliveredToPresenterSuccessfully() {
        let mockedSocialModel = getMockedSocialModel()
        self.mockSocialDataProvider?.successWithSocialModel = mockedSocialModel
        
        sut?.getSocialData()
        
        XCTAssertTrue(mockOutput!.isSocialDataFetchedSuccess)
        XCTAssertEqual(mockOutput!.fetchedSocialModel, mockedSocialModel)
    }
    
    
    // We can check that the presenter is called when timer is finished thus we can sure view will be updated with new social data info
    // I forced mocktimer is returned sync because other way unit test time will be so long
    func testSocialInfoRetryFinishedSuccessfully() {
        mockTimerDataProvider?.syncReturnComplation = true
        let mockedSocialModel = getMockedSocialModel()
        self.mockSocialDataProvider?.successWithSocialModel = mockedSocialModel
        
        sut?.getSocialData()
        
        XCTAssertTrue(mockOutput!.timerIsFinished)
        
    }
    
    
    // check to the counter timer is started after Social Info data is fetched successfully
    func testSocialInfoRetryIsStarted() {
        let mockedSocialModel = getMockedSocialModel()
        self.mockSocialDataProvider?.successWithSocialModel = mockedSocialModel
        
        sut?.getSocialData()
        
        XCTAssertTrue(mockTimerDataProvider?.timerIsStarted ?? false)
    }
    
    // mocked social model
    func getMockedSocialModel() -> SocialModel {
        let mockedSocialModel = SocialModel(likeCount: 10, commentCounts: CommentModel(averageRating: 4, anonymousCommentsCount: 1, memberCommentsCount: 2))
        
        return mockedSocialModel
    }
}
