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
    func navigateToDetalMovieView(with movie: Movie, view: UIViewController) {
        MovieDetailRouter.createModule(view: view, movie: movie)

    }
    
    class func createModule(view: UIViewController, movies: [Movie]){
        let movieView = mainstoryboard.instantiateViewController(withIdentifier: "AllPlayingMovies") as? AllPlayingMoviesView;
        let presenter = AllPlayingMoviesPresenter()
        let router = AllPlayingMoviesRouter()
        
        presenter.movies = AllPlayingMoviesEntity(movieArr: movies)
        movieView!.presenter = presenter
        presenter.view = movieView
        presenter.router = router
        
        view.navigationController?.pushViewController(movieView!, animated: true)
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
