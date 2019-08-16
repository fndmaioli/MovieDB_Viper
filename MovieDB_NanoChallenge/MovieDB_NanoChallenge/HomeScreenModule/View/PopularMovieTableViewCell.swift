//
//  PopularMovieTableViewCell.swift
//  MovieDB_NanoChallenge
//
//  Created by Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

class PopularMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class var customCell: PopularMovieTableViewCell {
        let cell = Bundle.main.loadNibNamed("PopularMovieTableViewCell", owner: self, options: nil)?.last
        return cell as! PopularMovieTableViewCell
    }
    
    func updateCellwithData(movie: Movie) {
        titleLabel.text = movie.name
    }
    
}
