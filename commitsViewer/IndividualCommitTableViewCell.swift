//
//  IndividualCommitTableViewCell.swift
//  commitsViewer
//
//  Created by Sreekanth Chavali on 2/22/20.
//  Copyright © 2020 Sreekanth Chavali. All rights reserved.
//

import UIKit

class IndividualCommitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageAvatar: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var commitNumberLabel: UILabel!
    
    @IBOutlet weak var commitMessageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageAvatar.layer.cornerRadius = 25
        commitNumberLabel.lineBreakMode = .byCharWrapping
        commitMessageLabel.lineBreakMode = .byTruncatingTail
    }
    
}
