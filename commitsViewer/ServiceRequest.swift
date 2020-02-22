//
//  ServiceRequest.swift
//  commitsViewer
//
//  Created by Sreekanth Chavali on 2/22/20.
//  Copyright © 2020 Sreekanth Chavali. All rights reserved.
//

import Foundation
import UIKit

class ServiceRequest: DisplayCommitsTableViewController {
    
    var displayInstance = DisplayCommitsTableViewController()
    
    public func fetchCommits(data: Data?, urlResponse: URLResponse?, error: Error?) -> Void {
        
        // List of commits from all available branches on the repo
        var commitsList: [[String: Any]]!
        
        do{
            try commitsList = JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String: Any]]
            
            if commitsList != nil {
                
                for item in commitsList {
                    
                    let commitID = item["sha"] as! String
                    
                    // Get user avatar from committer object
                    let committer = item["committer"] as! [String: Any]
                    let userAvatarString = committer["avatar_url"] as! String
                    
                    let commitObj = item["commit"] as! [String: Any]
                    let message = commitObj["message"] as! String
                    
                    // Get author name from author object
                    let author = commitObj["author"] as! [String: Any]
                    let name = author["name"] as! String
                    
                    guard let url = URL(string: userAvatarString) else { return }
                    guard let userAvatar = try? Data(contentsOf: url) else { return }
                    guard let image = UIImage(data: userAvatar) else { return }
                    
                    var newCommit = Commit()
                    
                    newCommit.commitID = commitID
                    newCommit.commitMessage = message
                    newCommit.userName = name
                    newCommit.userAvatar = image
                    
                    displayInstance.gitCommits.append(newCommit)
                }
                DispatchQueue.main.async {
                    print("Entered Dispacth")
                    self.displayInstance.viewDidAppear(true)
                    self.displayInstance.removeSpinner()
                }
                
            } else {
                print("Response was nil!")
            }
        }
        catch {
            print(error)
        }
    }
    
}
