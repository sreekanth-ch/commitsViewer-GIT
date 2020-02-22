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
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var commitNumber: UILabel!
    
    @IBOutlet weak var commitMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
