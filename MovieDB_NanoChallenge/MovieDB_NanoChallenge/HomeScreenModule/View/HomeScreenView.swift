//
//  HomeScreenView.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// HomeScreen Module View
class HomeScreenView: UIViewController {
    
    var presenter: HomeScreenPresenterProtocol!
    @IBOutlet weak var tableView: UITableView!
    var popularMovies: HomeScreenEntity?
    var nowPlayingMovies: HomeScreenEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
    }
    
}

// MARK: - extending HomeScreenView to implement it's protocol
extension HomeScreenView: HomeScreenViewProtocol {
    func presenterDidFetch(popularMovies object: HomeScreenEntity) {
        self.popularMovies = object
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func presenterDidFetch(nowPlayingMovies object: HomeScreenEntity) {
        self.nowPlayingMovies = object
        DispatchQueue.main.async {
            self.tableView.reloadSections([0], with: .none)
        }
    }
    
}

extension HomeScreenView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Now Playing"
        } else {
            return "Popular Movies"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell") as? CollectionTableViewCell
            if cell == nil {
                cell = CollectionTableViewCell.customCell
            }
            
            cell?.movies = nowPlayingMovies?.movieArr
            
            return cell!
        } else {
            var cell = tableView.dequeueReusableCell(withIdentifier: "PopularMovieTableViewCell") as? PopularMovieTableViewCell
            if cell == nil {
                cell = PopularMovieTableViewCell.customCell
            }
            cell?.titleLabel.text = self.popularMovies?.movieArr[indexPath.row].name
            cell?.descriptionLabel.text = self.popularMovies?.movieArr[indexPath.row].description
            cell?.ratingLabel.text = self.popularMovies?.movieArr[indexPath.row].rating
            guard let data = self.popularMovies?.movieArr[indexPath.row].cover else { return cell! }
            cell?.imageView?.image = UIImage(data: data)
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToMovieDetail(with: (popularMovies?.movieArr[indexPath.row])!, view: self)
    }
    
    
}
