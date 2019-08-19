//
//  MovieDetailView.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 16/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// MovieDetail Module View
class MovieDetailView: UIViewController {
    
    var presenter: MovieDetailPresenterProtocol!
    
    private var object : MovieDetailEntity?
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Informs the Presenter that the View is ready to receive data.
        let movie = presenter.fetchMovie(objectFor: self)
        presenter.fetchMovieGenres(objectFor: self, movie: movie)
        movieTitle.text = movie.name
        movieRating.text = movie.rating
        movieDescription.text = movie.description
        if let cover = movie.cover {
            movieImage.image = UIImage(data: cover)
        }
        movieCategory.text = "Loading genres..."
    }
    
}

// MARK: - extending MovieDetailView to implement it's protocol
extension MovieDetailView: MovieDetailViewProtocol {
    func didGetGenres(genres: [Genre]) {
        DispatchQueue.main.async {
            self.movieCategory.text = genres.map({ (genre) -> String in
                return genre.name ?? ""
            }).joined(separator: ", ")
        }
    }
    
    func didNotGetGenres() {
        DispatchQueue.main.async {
            self.movieCategory.isHidden = true
        }
    }
    
    
    
}
