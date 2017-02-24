//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var postImageView: UIImageView!
    var post: Post? {
        didSet {
            if !isViewLoaded {
                loadView()
            }
            updateViews()
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 50
        tableView.estimatedRowHeight = 100
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = post else { return 0 }
        return post.comments.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Keys.commentCell, for: indexPath)
        guard let post = post else {  fatalError() }
        let comment = post.comments[indexPath.row]
        
        cell.textLabel?.text = comment.text
        cell.detailTextLabel?.text = "The Date"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - UI Functions
    
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        addCommentAlert()
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    
   
    // MARK: - Update Function
    
    func updateViews() {
        guard let post = post else { return }
        postImageView.image = post.photo
    }
    
    // MARK: - Alert Controller
    func addCommentAlert() {
        guard let post = post else { return }
        let addCommentController = UIAlertController(title: "Add Comment", message: "Enter a Comment Below", preferredStyle: .alert)
        var commentTextField: UITextField?
        addCommentController.addTextField { (textField) in
            commentTextField = textField
        }
        let postAction = UIAlertAction(title: "Post", style: .default) { (_) in
            guard let commentText = commentTextField?.text, !commentText.isEmpty else { return }
            PostController.shared.addComment(toPost: post, text: commentText)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        addCommentController.addAction(postAction)
        addCommentController.addAction(cancelAction)
        
        present(addCommentController, animated: true, completion: nil)
        
    }
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
