//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by CHATHURA ELLAWALA on 2022-10-19.
//

import XCTest
@testable import FilmFest

final class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let fairyTale = Movie(title: "Firy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUp() {
        super.setUp()
        
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        libraryTableView = nil
        tableViewMock = nil
        libraryVC = nil
    }
    
    // MARK: - Sections
    func testTableViewSections_Count_ReturnsTwo() {        
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }

    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount() {
//        sut.movieManager?.addMovie(movie: fairyTale)
//        sut.movieManager?.addMovie(movie: darkComedy)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//
//        sut.movieManager?.addMovie(movie: thriller)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount() {
//        sut.movieManager?.addMovie(movie: fairyTale)
//        sut.movieManager?.addMovie(movie: darkComedy)
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    // MARK: - Cells
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: fairyTale)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
        sut.movieManager?.addMovie(movie: thriller)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: fairyTale)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, fairyTale)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData() {
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: thriller)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cellData = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cellData.movieData, fairyTale)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        sut.movieManager?.addMovie(movie: fairyTale)
        sut.movieManager?.addMovie(movie: thriller)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues() {
        let section1Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let section2title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movies To See")
        XCTAssertEqual(section2title, "Movies Seen")
    }
    

}
