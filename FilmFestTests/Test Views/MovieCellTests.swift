//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by CHATHURA ELLAWALA on 2022-10-19.
//

import XCTest
@testable import FilmFest

final class MovieCellTests: XCTestCase {
    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    var libraryVC: LibraryViewController!

    override func setUp() {
        super.setUp()
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }
    
    override func tearDown() {
        super.tearDown()
        
        libraryVC = nil
        tableView = nil
        mockDataSource = nil
    }
    
    func testCell_Config_ShouldSetLabelsToMovieData() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configMovieCell(movie: Movie(title: "Indie Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.textLabel?.text, "Indie Comedy")
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
    }

}
