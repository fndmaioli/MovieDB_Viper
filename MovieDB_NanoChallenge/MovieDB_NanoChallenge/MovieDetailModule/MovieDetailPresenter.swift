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
    
    var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?
    
    init() {
    }
}

// MARK: - extending MovieDetailPresenter to implement it's protocol
extension MovieDetailPresenter: MovieDetailPresenterProtocol {
    func fetch(objectFor view: MovieDetailViewProtocol) {
        print("dont know")

    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFetch object: MovieDetailEntity) {
        print("dont know")

    }
    
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFailWith error: Error) {
        print("dont know")
    }
    
    
}
