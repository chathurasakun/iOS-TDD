//
//  Movie.swift
//  FilmFest
//
//  Created by CHATHURA ELLAWALA on 2022-10-18.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}

func== (lhs: Movie, rhs: Movie) -> Bool {
    if lhs.title != rhs.title {
        return false
    }
    
    if lhs.releaseDate != rhs.releaseDate {
        return false
    }
    
    return true
}
