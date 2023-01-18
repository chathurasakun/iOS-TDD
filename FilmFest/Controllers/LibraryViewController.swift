//
//  LibraryViewController.swift
//  FilmFest
//
//  Created by CHATHURA ELLAWALA on 2022-10-17.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        dataService.movieManager?.addMovie(movie: Movie(title: "KungFu Panda", releaseDate: "2005"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Silent Assasin", releaseDate: "2001"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Act of Honor", releaseDate: "1990"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Lion king", releaseDate: "2000"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Ronaldo", releaseDate: "2015"))
        
        libraryTableView.reloadData()
    }


}

