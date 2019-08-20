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
    var loading: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        loading = UIActivityIndicatorView(frame: CGRect(x: self.view.frame.maxX/2, y: self.view.frame.maxY/2, width: 0, height: 0))
        loading?.color = .black
        self.view.addSubview(loading!)
        loading!.startAnimating()
        tableView.dataSource = self
        tableView.delegate = self
        // Informs the Presenter that the View is ready to receive data.
        presenter.fetch(objectFor: self)
        
        let nib = UINib(nibName: "SectionHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "SectionHeaderView")
        tableView.separatorColor = UIColor.clear
        
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
}

// MARK: - extending HomeScreenView to implement it's protocol
extension HomeScreenView: HomeScreenViewProtocol {
    func presenterDidFetch(popularMovies object: HomeScreenEntity) {
        var filteredArr = object.movieArr.sorted(by: { $0.rating > $1.rating })
        self.popularMovies = HomeScreenEntity(movieArr: filteredArr)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            if self.popularMovies != nil && self.nowPlayingMovies != nil {
                self.tableView.isHidden = false
                self.loading?.stopAnimating()
                self.loading?.isHidden = true
            }
        }
    }
    
    func presenterDidFetch(nowPlayingMovies object: HomeScreenEntity) {
        self.nowPlayingMovies = object
        DispatchQueue.main.async {
            self.tableView.reloadSections([0], with: .none)
            if self.popularMovies != nil && self.nowPlayingMovies != nil {
                self.tableView.isHidden = false
                self.loading?.stopAnimating()
                self.loading?.isHidden = true
            }
        }
        
    }
    
}

extension HomeScreenView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return popularMovies?.movieArr.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 297
        } else {
            return 160
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
            cell?.viewDelegate = self
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
            cell?.imageView?.layer.cornerRadius = 10
            cell?.imageView?.clipsToBounds = true
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.pushToMovieDetail(with: (popularMovies?.movieArr[indexPath.row])!, view: self)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Dequeue with the reuse identifier
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeaderView")
        let header = cell as! SectionHeaderTableView
        
        if section == 0 {
            header.sectionTitle.text = "Now Playing"
            header.delegate = self
        }else {
            header.sectionTitle.text = "Popular Movies"
            header.seeAllButton.isHidden = true
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension HomeScreenView: SectionHeaderDelegate {
    func didClickSeeAllButton() {
        guard let movies = nowPlayingMovies?.movieArr else { return }
        presenter.pushToNowPlayingMovies(view: self, with: movies)
    }
    
}

extension HomeScreenView: CollectionCellDelegate {
    func delegateToDetails(movie: Movie) {
        presenter.pushToMovieDetail(with: movie, view: self)
    }
}
