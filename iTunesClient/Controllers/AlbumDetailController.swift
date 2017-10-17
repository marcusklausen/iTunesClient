//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Marcus Klausen on 17/10/2017.
//  Copyright © 2017 Marcus Klausen. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    var album: Album?
    
    
    lazy var dataSource: AlbumDetailDataSource = {
        return AlbumDetailDataSource(songs: self.album!.songs)
    }()
    
    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let album = album {
            configure(with: album)
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = self

    }
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        // Add implementation for artworkView
        
        albumTitleLabel.text = viewModel.title
        albumGenreLabel.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate

    }

}