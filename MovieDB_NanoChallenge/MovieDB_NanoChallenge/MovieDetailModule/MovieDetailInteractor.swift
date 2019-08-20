//
//  MovieDetailInteractor.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 16/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// MovieDetail Module Interactor
class MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    var presenter: MovieDetailPresenterProtocol!
    
    func fetchMovieGenres(objectFor presenter: MovieDetailPresenterProtocol, movie: Movie){
        var genres = [Genre]()
        APIService.getMovieGenres(movieID: movie.id) { (genresAPI) in
            if let genresAPI = genresAPI {
                genres = genresAPI.genres!
                presenter.interactor(self, didFetch: genres)
                return
            }
            presenter.interactor(self, didFailWith: Error.self as! Error)
        }
    }
}
