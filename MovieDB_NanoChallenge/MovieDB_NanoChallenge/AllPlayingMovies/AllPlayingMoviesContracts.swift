//
//  AllPlayingMoviesContracts.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 20/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// AllPlayingMovies Module View Protocol
protocol AllPlayingMoviesViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type AllPlayingMoviesEntity
    func set(object: AllPlayingMoviesEntity)
}

//MARK: Interactor -
/// AllPlayingMovies Module Interactor Protocol
protocol AllPlayingMoviesInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: AllPlayingMoviesPresenterProtocol)
}

//MARK: Presenter -
/// AllPlayingMovies Module Presenter Protocol

protocol AllPlayingMoviesPresenterProtocol {
    
    func getData(for view: AllPlayingMoviesViewProtocol) -> [MovieHomeScreen]
    func pushToMovieDetail(with movie: MovieHomeScreen, view: UIViewController)
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: AllPlayingMoviesViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: AllPlayingMoviesInteractorProtocol, didFetch object: AllPlayingMoviesEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: AllPlayingMoviesInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// AllPlayingMovies Module Router Protocol
protocol AllPlayingMoviesRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: AllPlayingMoviesEntity, parentViewController viewController: UIViewController)
    func navigateToDetalMovieView(with movie: MovieHomeScreen, view: UIViewController)
}
