//
//  MovieDetailPresenter.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 16/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// MovieDetail Module Presenter
class MovieDetailPresenter {
    var movie: Movie!
    var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?
    
    init() {
    }
}

// MARK: - extending MovieDetailPresenter to implement it's protocol
extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func fetchMovieGenres(objectFor view: MovieDetailViewProtocol, movie: Movie) {
        interactor?.fetchMovieGenres(objectFor: self, movie: movie)
    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFetch object: [Genre]) {
        view?.didGetGenres(genres: object)
    }
    
    func fetchMovie(objectFor view: MovieDetailViewProtocol) -> Movie {
        return movie
    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFailWith error: Error) {
        view?.didNotGetGenres()
    }
    
}
