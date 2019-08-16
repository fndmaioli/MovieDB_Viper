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
    func pushToMovieDetail(with movie: Movie, view: UIViewController) {
        router?.navigateToDetalMovieView(with: movie, view: view)
    }
    
    func fetch(objectFor view: HomeScreenViewProtocol) {
        interactor!.fetch(objectFor: self)
    }
    
    func interactor(_ interactor: HomeScreenInteractorProtocol, didFetch object: HomeScreenEntity) {
        view?.presenterDidFetch(popularMovies: object)
    }
    
    func interactorDid(_ interactor: HomeScreenInteractorProtocol, FailWith error: Error) {
        print("dont know")
    }

}
