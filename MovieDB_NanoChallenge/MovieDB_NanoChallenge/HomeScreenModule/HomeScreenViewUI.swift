//
//  HomeScreenViewUI.swift
//  MovieDB_NanoChallenge
//
//  Created Fernando Locatelli Maioli on 15/08/19.
//  Copyright © 2019 Fernando Locatelli Maioli. All rights reserved.
//

import UIKit

// MARK: HomeScreenViewUI Delegate -
/// HomeScreenViewUI Delegate
protocol HomeScreenViewUIDelegate {
    // Send Events to Module View, that will send events to the Presenter; which will send events to the Receiver e.g. Protocol OR Component.
}

// MARK: HomeScreenViewUI Data Source -
/// HomeScreenViewUI Data Source
protocol HomeScreenViewUIDataSource {
    // This will be implemented in the Module View.
    /// Set Object for the UI Component
    func objectFor(ui: HomeScreenViewUI) -> HomeScreenEntity
}

class HomeScreenViewUI: UIView {
    
    var delegate: HomeScreenViewUIDelegate?
    var dataSource: HomeScreenViewUIDataSource?
    
    var object : HomeScreenEntity?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        setupConstraints()
    }
    
    fileprivate func setupUIElements() {
        // arrange subviews
    }
    
    fileprivate func setupConstraints() {
        // add constraints to subviews
    }
    
    /// Reloading the data and update the ui according to the new data
    func reloadData() {
        self.object = dataSource?.objectFor(ui: self)
        // Should update UI
    }
}
