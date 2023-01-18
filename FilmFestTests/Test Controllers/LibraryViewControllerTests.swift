//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by CHATHURA ELLAWALA on 2022-10-19.
//

import XCTest
@testable import FilmFest

final class LibraryViewControllerTests: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUp() {
        super.setUp()
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
    }
    
    // MARK: - Nil Checks
    func testLibraryVC_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    // MARK: - Data Source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: - Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    // MARK: - DataService Assumptions
    func testDataService_ViewDidLoad_SingleDataServiceObject() {
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }

}
