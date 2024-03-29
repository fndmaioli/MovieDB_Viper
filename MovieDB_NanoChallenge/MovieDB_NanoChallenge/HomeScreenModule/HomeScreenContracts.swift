//
//  HomeScreenContracts.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

//MARK: View -
/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// HomeScreen Module View Protocol
protocol HomeScreenViewProtocol: class {
    // Update UI with value returned.
    /// Set the view Object of Type HomeScreenEntity
    func presenterDidFetch(popularMovies: HomeScreenEntity)
    func presenterDidFetch(nowPlayingMovies: HomeScreenEntity)

}

//MARK: Interactor -
/// HomeScreen Module Interactor Protocol
protocol HomeScreenInteractorProtocol {
    // Fetch Object from Data Layer
    func fetchPopularMovies(objectFor presenter: HomeScreenPresenterProtocol)
    func fetchNowPlayingMovies(objectFor presenter: HomeScreenPresenterProtocol)
}

//MARK: Presenter -
/// HomeScreen Module Presenter Protocol
protocol HomeScreenPresenterProtocol {
    func pushToMovieDetail(with movie: Movie, view: UIViewController)
    func pushToNowPlayingMovies(view: UIViewController, with movies: [Movie])
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: HomeScreenViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: HomeScreenInteractorProtocol, didFetchPopularMovies object: HomeScreenEntity)
    func interactor(_ interactor: HomeScreenInteractorProtocol, didFetchNowPlayingMovies object: HomeScreenEntity)
    
    /// The Interactor will inform the Presenter a failed fetch.
    func interactorDid(_ interactor: HomeScreenInteractorProtocol, FailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// HomeScreen Module Router Protocol
protocol HomeScreenRouterProtocol {
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: HomeScreenEntity, parentViewController viewController: UIViewController)
    func navigateToDetailMovieModule( view: UIViewController, with movie: Movie)
    func navigateToNowPlayingMoviesModule(view: UIViewController, with movies: [Movie])
}
