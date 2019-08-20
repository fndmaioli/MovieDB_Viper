//
//  MovieDetailRouter.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 16/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// MovieDetail Module Router (aka: Wireframe)
class MovieDetailRouter: MovieDetailRouterProtocol {
    
    class func createModule(view: UIViewController, movie: Movie) {
        let movieView = mainstoryboard.instantiateViewController(withIdentifier: "MovieDetailView") as? MovieDetailView;
        let presenter = MovieDetailPresenter(movie: MovieDetailEntity(movie: movie, genres: nil))
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        
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
