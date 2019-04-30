//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by Nodirjon on 3/5/19.
//  Copyright © 2019 Nodirjon. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var toDoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.contentView.backgroundColor = UIColor.white
    }

}
