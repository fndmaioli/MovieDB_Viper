//
//  SectionHeaderView.swift
//  MovieDB_NanoChallenge
//
//  Created by Matheus Fogiatto on 20/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

protocol SectionHeaderDelegate:class {
    func didClickSeeAllButton()
}

class SectionHeaderTableView: UITableViewHeaderFooterView {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    var delegate: SectionHeaderDelegate?

    @IBAction func selectSeeAllButton(_ sender: UIButton) {
        delegate?.didClickSeeAllButton()
    }
}
