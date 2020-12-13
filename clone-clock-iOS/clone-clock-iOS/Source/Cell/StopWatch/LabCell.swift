//
//  LabCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/13.
//

import UIKit

class LabCell: UITableViewCell {

    @IBOutlet weak var labLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(index: Int, timer: String) {
        labLabel.textColor = .white
        timeLabel.textColor = .white
        contentView.backgroundColor = .black
        
        labLabel.text = "랩 \(index)"
        timeLabel.text = timer
        
        labLabel.sizeToFit()
        timeLabel.sizeToFit()
    }
}
