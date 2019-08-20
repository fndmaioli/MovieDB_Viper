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
    var router: AllPlayingMoviesRouterProtocol?
    var movies: [Movie]!
    
    init() {
        
    }
}

// MARK: - extending AllPlayingMoviesPresenter to implement it's protocol
extension AllPlayingMoviesPresenter: AllPlayingMoviesPresenterProtocol {
    func getData(for view: AllPlayingMoviesViewProtocol) -> [Movie] {
        return movies
    }
    
    func pushToMovieDetail(with movie: Movie, view: UIViewController) {
        router?.navigateToDetalMovieView(with: movie, view: view)
    }
    
    
}
