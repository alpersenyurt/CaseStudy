//
//  ProductDetailPresenterTest.swift
//  CaseStudyTests
//
//  Created by ALPER SENYURT on 13.03.2020.
//  Copyright © 2020 alperSenyurt. All rights reserved.
//

import XCTest
@testable import CaseStudy

class ProductDetailPresenterTest: XCTestCase {
    
    var sut: ProductDetailPresenter!
    var mockInteractor: MockProductDetailInteractor?
    var mockView: MockProductView?
    var mockRouter: MockProductDetailRouter?
    
    override func setUp() {
        mockInteractor = MockProductDetailInteractor()
        mockView = MockProductView()
        mockRouter = MockProductDetailRouter()
        
        sut = ProductDetailPresenter()
        sut.interactor = mockInteractor
        mockInteractor?.output = sut
        sut.view = mockView
        sut.router  = mockRouter
        
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockRouter = nil
        mockInteractor = nil
        mockView = nil
        super.tearDown()
        
    }
    
    // Interactor is forced to loading state and thus We can test that the presenter updates view states with loading or not
    func testProducViewIsInformedAboutInitialLoadingState() {
        mockInteractor?.processProductDataLoadingState = true
        sut.viewDidLoad()
        XCTAssertEqual(mockView?.viewState, StateType.loading)
    }
    
    // Interactor is forced to fail We can test that the presenter updates view states with error or not
    func testProducViewStateUpdatedToFailureState() {
        let error = ProductError.productInfoError
        mockInteractor?.failureProductError = error
        sut.fetchProductData()
        XCTAssertEqual(mockView?.viewState, StateType.error(error))
    }
    
    // interactor is forced to be success about the fetching product info
    // this test checks to make sure that we tell the view to finish loading state when a result is loaded successfully
    func testProductViewStateUpdatedWhenSuccesIsReturned() {
        let mockedProductModel = createProductModel()
        mockInteractor?.productModel = mockedProductModel
        sut.fetchProductData()
        XCTAssertEqual(mockView?.viewState, StateType.success)
    }
    
    // interactor is forced to be success about the fetching social info and we check that the presenter updated the view with the right info
    // we check social like count rating comment
    func testSocialDataDeliveredToViewCorrectly() {
        let mockedSocialModel = SocialModel(likeCount: 10, commentCounts: CommentModel(averageRating: 4, anonymousCommentsCount: 1, memberCommentsCount: 2))
        mockInteractor?.socialModel = mockedSocialModel
        let totalCommentString = "( \(mockedSocialModel.commentCounts.anonymousCommentsCount + mockedSocialModel.commentCounts.memberCommentsCount) Yorum)"
        
        sut.fetchSocialData()
        
        XCTAssertEqual(mockView?.productViewLikeCount, mockedSocialModel.likeCount)
        XCTAssertEqual(mockView?.productViewRating,Double( mockedSocialModel.commentCounts.averageRating))
        XCTAssertEqual(mockView?.productViewCommentLabelText, totalCommentString)
    }
    
    // interactor is forced to be success about the fetching product info and we check that the presenter updated the view with the right info
    // we check product name, desc, price and currency
    func testProductInfoDeliveredToViewCorrectly() {
        let mockedProductModel = createProductModel()
        mockInteractor?.productModel = mockedProductModel
        let priceString =  String(mockedProductModel.priceModel.value) + " " + mockedProductModel.priceModel.currency
        sut.fetchProductData()
        
        XCTAssertEqual(mockView?.productNameLabelText, mockedProductModel.name)
        XCTAssertEqual(mockView?.productDescLabelText, mockedProductModel.desc)
        XCTAssertEqual(mockView?.productImageStringUrl, mockedProductModel.imageUrlString)
        XCTAssertEqual(mockView?.productPriceString, priceString)
        
        
    }
    
    //mocked product model
    func createProductModel() -> ProductModel {
        let priceModel = PriceModel(value: 20, currency: "TR")
        let mockedProductModel = ProductModel(pid: 1, name: "TestProduct", desc: "Test", imageUrlString: "dummyImage", priceModel: priceModel)
        return mockedProductModel
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
