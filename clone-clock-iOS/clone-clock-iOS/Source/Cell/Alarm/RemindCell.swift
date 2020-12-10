//
//  RemindCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/11.
//

import UIKit

class RemindCell: UITableViewCell {
    static let identifier = "RemindCell"

    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension RemindCell {
    func setCell(_ title: String, _ info: String) {
        cellTitleLabel.text = title
        cellTitleLabel.textColor = .white
        
        // fix: 타입..을 바꾸자
        if info == "true" {
            cellSwitch.isOn = true
        } else {
            cellSwitch.isOn = false
        }
    }
}
