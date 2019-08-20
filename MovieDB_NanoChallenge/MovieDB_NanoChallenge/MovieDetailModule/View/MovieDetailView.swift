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
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Informs the Presenter that the View is ready to receive data.
        let movie = presenter.fetchMovie(objectFor: self)
        presenter.fetchMovieGenres(objectFor: self, movie: movie.movie)
        movieTitle.text = movie.movie.name
        movieRating.text = movie.movie.rating
        movieDescription.text = movie.movie.description
        if let cover = movie.movie.cover {
            movieImage.image = UIImage(data: cover)
        }
        if movie.genres == nil {
            movieCategory.text = "Loading genres..."
        } else {
            self.didGetGenres(genres: movie.genres!)
        }
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
