//
//  PostListTableViewController.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController, UISearchResultsUpdating {
    
    // MARK: - Properties
    
    var searchController: UISearchController?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSearchController()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.shared.posts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.postCellKey, for: indexPath) as? PostTableViewCell else { return PostTableViewCell() }
        let post = PostController.shared.posts[indexPath.row]
        
        cell.post = post
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
       
    // MARK: - Search Controller
    
    func setUpSearchController() {
        
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "resultsController") as? SeachResultsTableViewController
        searchController = UISearchController(searchResultsController: resultsController)
        searchController?.searchResultsUpdater = self
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.searchBar.sizeToFit()

        tableView.tableHeaderView = searchController?.searchBar
        
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let resultsViewController = searchController.searchResultsController as? SeachResultsTableViewController,
            let searchText = searchController.searchBar.text else { return }
        
        let posts = PostController.shared.posts
        let filteredPosts = posts.filter { $0.matches(searchTerm: searchText) }.map { $0 as SearchableRecord }
        resultsViewController.resultsArray = filteredPosts
        resultsViewController.tableView.reloadData()
    }
    
    
    /*
     
     func updateSearchResults(for searchController: UISearchController) {
     
     if let resultsViewController = searchController.searchResultsController as? SearchResultsTableViewController,
     let searchTerm = searchController.searchBar.text?.lowercased() {
     
     let posts = PostController.sharedController.posts
     let filteredPosts = posts.filter { $0.matches(searchTerm: searchTerm) }.map { $0 as SearchableRecord }
     resultsViewController.resultsArray = filteredPosts
     resultsViewController.tableView.reloadData()
     }
     }
     
     */
    
    
        // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == Keys.detailKey {
            guard let detailVC = segue.destination as? PostDetailTableViewController else { return }
            let post = PostController.shared.posts[indexPath.row]
            detailVC.post = post
            
        }
    }
    
    
}
