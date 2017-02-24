//
//  Post.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class Post: SearchableRecord {
    var photoData: Data?
    var timestamp: Date
    var comments: [Comment]
    var photo: UIImage {
        guard let photoData = photoData,
            let photo = UIImage(data: photoData) else { return UIImage() }
        return photo
    }
    
    init(photoData: Data?, timestamp: Date = Date(), comments: [Comment] = []) {
        self.photoData = photoData
        self.timestamp = timestamp
        self.comments = comments
    }
    
    func matches(searchTerm: String) -> Bool {
        let matchingComponents = comments.filter { $0.matches(searchTerm: searchTerm) }
        return !matchingComponents.isEmpty
    }
}
