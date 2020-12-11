//
//  LabelCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/11.
//

import UIKit

class LabelCell: UITableViewCell {
    static let identifier = "LabelCell"

    @IBOutlet weak var cellInfoLabel: UILabel!
    
    var cellTitle: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
