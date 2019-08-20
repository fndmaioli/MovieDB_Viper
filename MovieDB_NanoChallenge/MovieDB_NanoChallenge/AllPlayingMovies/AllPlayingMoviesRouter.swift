//
//  AllPlayingMoviesRouter.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 20/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// AllPlayingMovies Module Router (aka: Wireframe)
class AllPlayingMoviesRouter: AllPlayingMoviesRouterProtocol {
    func navigateToDetalMovieView(with movie: MovieHomeScreen, view: UIViewController) {
        MovieDetailRouter.createModule(view: view, movie: movie)

    }
    
    class func createModule(view: UIViewController, movies: [MovieHomeScreen]){
        let movieView = mainstoryboard.instantiateViewController(withIdentifier: "AllPlayingMovies") as? AllPlayingMoviesView;
        let presenter = AllPlayingMoviesPresenter()
        let interactor = AllPlayingMoviesInteractor()
        let router = AllPlayingMoviesRouter()
        
        presenter.movies = movies
        movieView!.presenter = presenter
        interactor.presenter = presenter
        presenter.view = movieView
        presenter.interactor = interactor
        presenter.router = router
        
        view.navigationController?.pushViewController(movieView!, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
