//
//  MovieDetailView.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 16/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// MovieDetail Module View
class MovieDetailView: UIViewController {
    
    var presenter: MovieDetailPresenterProtocol!
    
    private var object : MovieDetailEntity?
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending MovieDetailView to implement it's protocol
extension MovieDetailView: MovieDetailViewProtocol {
    
    
}
