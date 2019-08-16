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
}

//MARK: Interactor -
/// MovieDetail Module Interactor Protocol
protocol MovieDetailInteractorProtocol {
    // Fetch Object from Data Layer
    func fetch(objectFor presenter: MovieDetailPresenterProtocol)
}

//MARK: Presenter -
/// MovieDetail Module Presenter Protocol
protocol MovieDetailPresenterProtocol {
    /// The presenter will fetch data from the Interactor thru implementing the Interactor fetch function.
    func fetch(objectFor view: MovieDetailViewProtocol)
    /// The Interactor will inform the Presenter a successful fetch.
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFetch object: MovieDetailEntity)
    /// The Interactor will inform the Presenter a failed fetch.
    func interactor(_ interactor: MovieDetailInteractorProtocol, didFailWith error: Error)
}

//MARK: Router (aka: Wireframe) -
/// MovieDetail Module Router Protocol
protocol MovieDetailRouterProtocol {
//    func createModule(view: UIViewController, movie: Movie) 
    // Show Details of Entity Object coming from ParentView Controller.
    // func showDetailsFor(object: MovieDetailEntity, parentViewController viewController: UIViewController)
}
