//
//  CollectionTableViewCell.swift
//  MovieDB_NanoChallenge
//
//  Created by Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

protocol CollectionCellDelegate:class {
    func delegateToDetails(movie: Movie)
}

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [Movie]?
    let cellReuseID = "CollectionViewCell"
    var viewDelegate: CollectionCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let deviceSize = UIScreen.main.bounds.size
        let cardWidthToScreenWidthRatio = 0.40 as CGFloat
        let cardWidth = deviceSize.width*cardWidthToScreenWidthRatio
        flowLayout.itemSize = CGSize(width: cardWidth, height: 277)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        self.collectionView.collectionViewLayout = flowLayout
        
        let cellNib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var customCell: CollectionTableViewCell {
        let cell = Bundle.main.loadNibNamed("CollectionTableViewCell", owner: self, options: nil)?.last
        return cell as! CollectionTableViewCell
    }

}
extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numMovies = movies?.count else {
            return 0
        }
        if numMovies > 5 {
            return 5
        }
        return numMovies
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
        viewDelegate.delegateToDetails(movie: movies[indexPath.row])
    }
}
