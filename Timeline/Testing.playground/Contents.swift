//: Playground - noun: a place where people can play

import UIKit
import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}

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


let aPost = Post(photoData: nil)
let comment1 = Comment(text: "Hello", post: aPost)
let comment2 = Comment(text: "comment2", post: aPost)

aPost.comments.append(comment1)
aPost.comments.append(comment2)

aPost.matches(searchTerm: "dello")





