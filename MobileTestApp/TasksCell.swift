//
//  TasksCell.swift
//  MobileTestApp
//
//  Created by Ahmed El-elaimy on 29/06/2022.
//

import UIKit

class TasksCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel : UILabel!
    @IBOutlet weak var tasksLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
