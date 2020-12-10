//
//  AddAlarmCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/10.
//

import UIKit

class RepeatCell: UITableViewCell {
    static let identifier = "RepeatCell"
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension RepeatCell {
    func setCell(_ title: String, _ info: Any) {
        cellTitleLabel.text = title
        cellTitleLabel.textColor = .white
        
        cellInfoLabel.text = "\(info)"
    }
}
