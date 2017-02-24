//
//  PostTableViewCell.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
  
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let post = post else { return }
        postImageView.image = post.photo
    }
    
    
}
