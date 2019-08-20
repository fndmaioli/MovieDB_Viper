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
    @IBOutlet weak var starImage: UIImageView!
    
    var movie: MovieHomeScreen?
    
    func updateCellWithData(movie: MovieHomeScreen){
        self.movie = movie
        self.titleLabel.text = movie.name
        self.ratingLabel.text = movie.rating
        if let cover = movie.cover {
            imageView.image = UIImage(data: cover)
        }
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        starImage.tintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }

}
