//
//  CollectionTableViewCell.swift
//  MovieDB_NanoChallenge
//
//  Created by Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [MovieHomeScreen]?
    let cellReuseID = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let deviceSize = UIScreen.main.bounds.size
        let cardWidthToScreenWidthRatio = 0.89 as CGFloat
        let cardWidth = deviceSize.width*cardWidthToScreenWidthRatio
        flowLayout.itemSize = CGSize(width: cardWidth, height: 420)
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        let cardConstraintToScreenWidthRatio = 0.048 as CGFloat
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: cardConstraintToScreenWidthRatio*deviceSize.width, bottom: 0, right: cardConstraintToScreenWidthRatio*deviceSize.width)
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
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as! MovieCollectionViewCell
        if let movie = self.movies?[indexPath.item] {
            cell.updateCellWithData(movie: movie)
        }
        
        return cell
    }
    
    
}
