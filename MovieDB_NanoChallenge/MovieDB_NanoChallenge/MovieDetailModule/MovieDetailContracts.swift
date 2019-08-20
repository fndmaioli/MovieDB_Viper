//
//  MovieDetailContracts.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 16/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// MovieDetail Module View Protocol
protocol MovieDetailViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type MovieDetailEntity
//    func set(object: MovieDetailEntity)
    func didGetGenres(genres: [Genre])
    func didNotGetGenres()
}

//MARK: Interactor -
/// MovieDetail Module Interactor Protocol
protocol MovieDetailInteractorProtocol {
    // Fetch Object from Data Layer
    func fetchMovieGenres(objectFor presenter: MovieDetailPresenterProtocol, movie: Movie)
    
}

//MARK: Presenter -
/// MovieDetail Module Presenter Protocol
protocol MovieDetailPresenterProtocol {
    func fetchMovie(objectFor view: MovieDetailViewProtocol) -> Movie
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFetch object: [Genre])
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFailWith error: Error)
    func fetchMovieGenres(objectFor view: MovieDetailViewProtocol, movie: Movie)
}

//MARK: Router (aka: Wireframe) -
/// MovieDetail Module Router Protocol
protocol MovieDetailRouterProtocol {
//    func createModule(view: UIViewController, movie: Movie) 
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: MovieDetailEntity, parentViewController viewController: UIViewController)
}
