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
    
    func fetchMovieGenres(objectFor presenter: MovieDetailPresenterProtocol, movie: MovieHomeScreen){
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
    
    
    var presenter: MovieDetailPresenterProtocol!

    
    func fetch(objectFor presenter: MovieDetailPresenterProtocol) {
        print("dont know")

    }
    

}
