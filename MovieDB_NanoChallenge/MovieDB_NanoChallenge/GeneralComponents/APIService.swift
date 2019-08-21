//
//  APIService.swift
//  mvvm-event
//
//  Created by Guilherme Piccoli on 16/04/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct APIService {
    

    
    static func getPopularMovies(fromPage page: Int = 1, completionHandler completion: @escaping (MoviePopular?) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=edac55baa5247ecf4089bac4553ff6ed&language=en-US&page=\(page)")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    do {
                        let movie = try JSONDecoder().decode(MoviePopular.self, from: data!)
                        completion(movie)
                    } catch {
                        print(error)
                        completion(nil)
                    }
//                    completion(movie)
                    return
                }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }
    
    static func getMovieGenres(movieID: String,fromPage page: Int = 1, completionHandler completion: @escaping (MovieDetail?) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=edac55baa5247ecf4089bac4553ff6ed&language=en-US")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    do {
                        let movie = try JSONDecoder().decode(MovieDetail.self, from: data!)
                        completion(movie)
                    } catch {
                        print(error)
                        completion(nil)
                    }
                    //                    completion(movie)
                    return
            }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }
    
    static func getNowPlayingMovies(fromPage page: Int = 1, completionHandler completion: @escaping (MovieNowPlaying?) -> Void) {
        var request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=edac55baa5247ecf4089bac4553ff6ed&language=en-US&page=\(page)")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            guard let error = error
                else {
                    do {
                        let movie = try JSONDecoder().decode(MovieNowPlaying.self, from: data!)
                        completion(movie)
                    } catch {
                        print(error)
                        completion(nil)
                    }
                    //                    completion(movie)
                    return
            }
            print(error.localizedDescription)
            completion(nil)
            return
        })
        dataTask.resume()
    }
}
