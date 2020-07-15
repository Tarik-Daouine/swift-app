//
//  MessageCell.swift
//  imageView
//
//  Created by Tarik Daouine on 07/08/2019.
//  Copyright © 2019 Tarik Daouine. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var destiLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
