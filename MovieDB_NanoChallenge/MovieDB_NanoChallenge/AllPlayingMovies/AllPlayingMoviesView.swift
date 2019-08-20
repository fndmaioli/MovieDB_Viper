//
//  AllPlayingMoviesView.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 20/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

/// AllPlayingMovies Module View
class AllPlayingMoviesView: UIViewController {
    
    var presenter: AllPlayingMoviesPresenterProtocol!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie]?
    let cellReuseID = "CollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        movies = presenter.getData(for: self)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let deviceSize = UIScreen.main.bounds.size
        let cardWidthToScreenWidthRatio = 0.40 as CGFloat
        let cardWidth = deviceSize.width*cardWidthToScreenWidthRatio
        flowLayout.itemSize = CGSize(width: cardWidth, height: 277)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        self.collectionView.collectionViewLayout = flowLayout
    }
}

// MARK: - extending AllPlayingMoviesView to implement it's protocol
extension AllPlayingMoviesView: AllPlayingMoviesViewProtocol {

}

extension AllPlayingMoviesView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as! MovieCollectionViewCell
        if let movie = self.movies?[indexPath.item] {
            cell.updateCellWithData(movie: movie)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let movies = movies else { return }
        presenter.pushToMovieDetail(with: movies[indexPath.row], view: self)
    }
    
}

