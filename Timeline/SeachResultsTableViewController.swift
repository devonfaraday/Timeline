//
//  SeachResultsTableViewController.swift
//  Timeline
//
//  Created by Christian McMullin on 2/20/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import UIKit

class SeachResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
    // MARK: - Properties
    
    var resultsArray = [SearchableRecord]()
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Keys.searchResultsCell, for: indexPath) as? PostTableViewCell,
        let result = resultsArray[indexPath.row] as? Post else { return PostTableViewCell() }
        
        cell.post = result
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presentingViewController = PostListTableViewController()
        let sendingCell = tableView.indexPathForSelectedRow
        presentingViewController.performSegue(withIdentifier: Keys.fromSearchToDetailSegue, sender: sendingCell)
    }
}
