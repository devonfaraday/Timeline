//
//  PostController.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let shared = PostController()
    var posts = [Post]()
    
    func createPostWith(image: UIImage, caption: String) {
        
        let newPost = Post(photoData: UIImageJPEGRepresentation(image, 1.0))
        posts.append(newPost)
        let comment = Comment(text: caption, post: newPost)
        newPost.comments.append(comment)
        
        
    }
    
    func addComment(toPost: Post, text: String) {
        let newComment = Comment(text: text, post: toPost)
        toPost.comments.append(newComment)
    }
}
