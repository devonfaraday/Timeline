//
//  Comment.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation

class Comment: SearchableRecord {
    let text: String
    let timestamp: Date
    let post: Post
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
    
    func matches(searchTerm: String) -> Bool {
        if self.text.contains(searchTerm) {
            return true
        } else {
            return false
        }
    }
}


/*
 
 
 Update the Post class to conform to the SearchableRecord protocol. Return true if any of the Post comments match, otherwise return false.
 Use a Playground to test your SearchableRecord and matches(searchTerm: String) functionality and understand what you are implementing.
 
 */
