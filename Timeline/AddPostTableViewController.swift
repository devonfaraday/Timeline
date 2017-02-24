//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
      // MARK: - UI Functions
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        postImageView.image = #imageLiteral(resourceName: "Kendall")
        selectImageButton.setTitle("", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        
        guard let postImage = postImageView.image else {
            addField(needed: "Image")
            return }
        guard let captionText = captionTextField.text, !captionText.isEmpty else {
            addField(needed: "a Caption")
            return }
        PostController.shared.createPostWith(image: postImage, caption: captionText)
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Alert Controllers
    
    func addField(needed: String) {
        let addStuffAlert = UIAlertController(title: "WAIT!", message: "Please add \(needed)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        addStuffAlert.addAction(okAction)
        present(addStuffAlert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
