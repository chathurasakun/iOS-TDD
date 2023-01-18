//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by CHATHURA ELLAWALA on 2022-10-18.
//

import XCTest
@testable import FilmFest

final class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    var scifiMovie: Movie!
    var arthouseMovie: Movie!
    var actionMovie: Movie!
    
    override func setUp() {
        super.setUp()
        
        sut = MovieManager()
        scifiMovie = Movie(title: "Sci-Fi")
        arthouseMovie = Movie(title: "Arthouse Drama")
        actionMovie = Movie(title: "Action/Adventure")
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        scifiMovie = nil
        arthouseMovie = nil
        actionMovie = nil
    }
    
    // MARK: - Initialization
    func testInit_MoviesToSee_ReturnsZero() {
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeenCount_ReturnsZero() {
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: - Add & Query
    func testAddMoviesToSee_ReturnsOne() {
        sut.addMovie(movie: scifiMovie)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex() {
        sut.addMovie(movie: arthouseMovie)
        
        let movieQuerried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie.title, movieQuerried.title)
    }
    
    // MARK: - Checking Off
    func testCheckOffMovie_UpdatesMovieManagerCounts() {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex() {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let queriedMovie = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, queriedMovie.title)
    }
    
    // MARK: - Equatable
    func testEquatable_ReturnsTrue() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Action")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let actionMovie1 = Movie(title: "Action")
        let actionMovie2 = Movie(title: "Adventure")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentReleaseDates() {
        let actionMovie1 = Movie(title: "Action", releaseDate: "1999")
        let actionMovie2 = Movie(title: "Action", releaseDate: "2018")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
    }
    
    func testClearArrays_ReturnsArrayCountsOfZero() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // MARK: - Duplicates
    func testDuplicates_ShouldNotBeAddedToArray() {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }

}
