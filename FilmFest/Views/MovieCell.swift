//
//  MovieCell.swift
//  FilmFest
//
//  Created by CHATHURA ELLAWALA on 2022-10-19.
//

import UIKit

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configMovieCell(movie: Movie) {
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
    }

}
