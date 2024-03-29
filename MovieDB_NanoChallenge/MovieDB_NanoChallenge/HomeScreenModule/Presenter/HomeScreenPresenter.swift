//
//  HomeScreenPresenter.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// HomeScreen Module Presenter
class HomeScreenPresenter {
    
    var view: HomeScreenViewProtocol?
    var interactor: HomeScreenInteractorProtocol?
    var router: HomeScreenRouterProtocol?
    
    init() {
    }
}

// MARK: - extending HomeScreenPresenter to implement it's protocol
extension HomeScreenPresenter: HomeScreenPresenterProtocol {
    func pushToNowPlayingMovies(view: UIViewController, with movies: [Movie]) {
        router?.navigateToNowPlayingMoviesModule(view: view, with: movies)
    }
    
    func pushToMovieDetail(with movie: Movie, view: UIViewController) {
        router?.navigateToDetailMovieModule(view: view, with: movie)
    }
    
    func fetch(objectFor view: HomeScreenViewProtocol) {
        interactor?.fetchPopularMovies(objectFor: self)
        interactor?.fetchNowPlayingMovies(objectFor: self)
        
    }
    
    func interactor(_ interactor: HomeScreenInteractorProtocol, didFetchNowPlayingMovies object: HomeScreenEntity) {
        view?.presenterDidFetch(nowPlayingMovies: object)
    }
    
    func interactor(_ interactor: HomeScreenInteractorProtocol, didFetchPopularMovies object: HomeScreenEntity) {
        view?.presenterDidFetch(popularMovies: object)

    }
    
    func interactorDid(_ interactor: HomeScreenInteractorProtocol, FailWith error: Error) {
        print("dont know")
    }

}
