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
    
    var movie: Movie?
    
    func updateCellWithData(movie: Movie){
        self.movie = movie
    }

}
