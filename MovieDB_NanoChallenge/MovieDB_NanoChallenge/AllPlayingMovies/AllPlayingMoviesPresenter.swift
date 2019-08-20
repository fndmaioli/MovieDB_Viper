//
//  AllPlayingMoviesPresenter.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 20/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// AllPlayingMovies Module Presenter
class AllPlayingMoviesPresenter {
    
    var view: AllPlayingMoviesViewProtocol?
    var interactor: AllPlayingMoviesInteractorProtocol?
    var router: AllPlayingMoviesRouterProtocol?
    var movies: [MovieHomeScreen]!
    
    init() {
        
    }
}

// MARK: - extending AllPlayingMoviesPresenter to implement it's protocol
extension AllPlayingMoviesPresenter: AllPlayingMoviesPresenterProtocol {
    func getData(for view: AllPlayingMoviesViewProtocol) -> [MovieHomeScreen] {
        return movies
    }
    
    func pushToMovieDetail(with movie: MovieHomeScreen, view: UIViewController) {
        router?.navigateToDetalMovieView(with: movie, view: view)
    }
    
    func fetch(objectFor view: AllPlayingMoviesViewProtocol) {
        print("Dont know")
    }
    
    func interactor(_ interactor: AllPlayingMoviesInteractorProtocol, didFetch object: AllPlayingMoviesEntity) {
        print("Dont know")

    }
    
    func interactor(_ interactor: AllPlayingMoviesInteractorProtocol, didFailWith error: Error) {
        print("Dont know")

    }
    
    
}
