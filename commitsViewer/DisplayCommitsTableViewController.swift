//
//  TableViewController.swift
//  commitsViewer
//
//  Created by Sreekanth Chavali on 2/22/20.
//  Copyright © 2020 Sreekanth Chavali. All rights reserved.
//

import UIKit

class DisplayCommitsTableViewController: UITableViewController {
    
    var gitCommits: [Commit] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        showSpinner(onView: self.view)
        
        let urlSession = URLSession.shared
        let urlString = urlStr
        
        guard let url = URL(string: urlString) else {return}
        
        urlSession.dataTask(with: url, completionHandler: ServiceRequest().fetchCommits).resume()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return gitCommits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "individualCommitCell", for: indexPath) as! IndividualCommitTableViewCell
        
        cell.commitNumberLabel.text = "CommitID: " + gitCommits[indexPath.row].commitID
        
        cell.commitMessageLabel.text = "Commit Message: " + gitCommits[indexPath.row].commitMessage
        
        cell.imageAvatar.image = gitCommits[indexPath.row].userAvatar
        
        cell.userNameLabel.text = "Commited by: " + gitCommits[indexPath.row].userName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 175
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
}
