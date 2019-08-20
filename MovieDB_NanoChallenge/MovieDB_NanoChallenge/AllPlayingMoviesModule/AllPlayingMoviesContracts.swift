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
    
    func getData(for view: AllPlayingMoviesViewProtocol) -> AllPlayingMoviesEntity
    func pushToMovieDetail(with movie: Movie, view: UIViewController)
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    /// The Interactor will inform the Presenter a successful fetch.
    /// The Interactor will inform the Presenter a failed fetch.
}

//MARK: Router (aka: Wireframe) -
/// AllPlayingMovies Module Router Protocol
protocol AllPlayingMoviesRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: AllPlayingMoviesEntity, parentViewController viewController: UIViewController)
    func navigateToDetalMovieView(with movie: Movie, view: UIViewController)
}
