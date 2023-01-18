//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by CHATHURA ELLAWALA on 2022-10-18.
//

import XCTest
@testable import FilmFest

final class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
     
    }

    override func tearDownWithError() throws {
       
    }
    
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1987")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }

}
