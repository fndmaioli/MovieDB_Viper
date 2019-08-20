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
    var movie: MovieDetailEntity
    var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?
    
    init(movie: MovieDetailEntity) {
        self.movie = movie
    }
}

// MARK: - extending MovieDetailPresenter to implement it's protocol
extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    func fetchMovieGenres(objectFor view: MovieDetailViewProtocol, movie: Movie) {
        interactor?.fetchMovieGenres(objectFor: self, movie: movie)
    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFetch object: [Genre]) {
        view?.didGetGenres(genres: object)
        self.movie.genres = object
    }
    
    func fetchMovie(objectFor view: MovieDetailViewProtocol) -> MovieDetailEntity {
        return movie
    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFailWith error: Error) {
        view?.didNotGetGenres()
    }
    
}
