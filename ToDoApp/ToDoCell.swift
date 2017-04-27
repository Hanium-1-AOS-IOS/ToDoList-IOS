//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by 황원준 on 2017. 4. 28..
//  Copyright © 2017년 황원준. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
