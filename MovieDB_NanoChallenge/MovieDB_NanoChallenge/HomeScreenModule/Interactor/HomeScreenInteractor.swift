//
//  HomeScreenInteractor.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// HomeScreen Module Interactor
class HomeScreenInteractor: HomeScreenInteractorProtocol {
    
    var presenter: HomeScreenPresenterProtocol!
    
    func fetchPopularMovies(objectFor presenter: HomeScreenPresenterProtocol) {
        APIService.getPopularMovies { (movieList) in
            if movieList == nil {
//                self.presenter.interactorDid(self, FailWith: Error.self as! Error)
            }
            var entity = HomeScreenEntity(movieArr: [Movie]())
            for movieRes in movieList!.results {
                guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + movieRes.posterPath) else { return }
                let data = try! Data(contentsOf: imageUrl)
                let movie = Movie(id: "\(movieRes.id)", name: movieRes.title, cover: data, description: movieRes.overview, rating: String(movieRes.voteAverage))
                entity.movieArr.append(movie)
            }
            
            self.presenter.interactor(self, didFetchPopularMovies: entity)
        }
    }
    
    func fetchNowPlayingMovies(objectFor presenter: HomeScreenPresenterProtocol) {
        APIService.getPopularMovies { (movieList) in
            if movieList == nil {
                //                self.presenter.interactorDid(self, FailWith: Error.self as! Error)
            }
            var entity = HomeScreenEntity(movieArr: [Movie]())
            for movieRes in movieList!.results {
                guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + movieRes.posterPath) else { return }
                let data = try! Data(contentsOf: imageUrl)
                let movie = Movie(id: "\(movieRes.id)", name: movieRes.title, cover: data, description: movieRes.overview, rating: String(movieRes.voteAverage))
                entity.movieArr.append(movie)
            }
            
            self.presenter.interactor(self, didFetchNowPlayingMovies: entity)
        }
    }
}
