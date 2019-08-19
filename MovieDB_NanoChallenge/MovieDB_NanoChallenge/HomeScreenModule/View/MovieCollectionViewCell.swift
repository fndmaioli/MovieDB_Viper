//
//  MovieCollectionViewCell.swift
//  MovieDB_NanoChallenge
//
//  Created by Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var movie: MovieHomeScreen?
    
    func updateCellWithData(movie: MovieHomeScreen){
        self.movie = movie
        self.titleLabel.text = movie.name
    }

}
