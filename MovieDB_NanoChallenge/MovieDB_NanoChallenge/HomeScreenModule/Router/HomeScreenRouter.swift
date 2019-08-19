//
//  HomeScreenRouter.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//
import Foundation
import UIKit

/// HomeScreen Module Router (aka: Wireframe)
class HomeScreenRouter: HomeScreenRouterProtocol {
    
    
    func navigateToDetalMovieView(with movie: MovieHomeScreen, view: UIViewController) {
        MovieDetailRouter.createModule(view: view, movie: movie)
    }
    
    class func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeScreenView") as? HomeScreenView
        let presenter = HomeScreenPresenter()
        let interactor = HomeScreenInteractor()
        let router = HomeScreenRouter()
        
        view?.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view!
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
