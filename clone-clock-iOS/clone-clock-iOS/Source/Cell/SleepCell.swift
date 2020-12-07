//
//  SleepCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/06.
//

import UIKit

class SleepCell: UITableViewCell {
    static let identifier = "SleepCell"
    
    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var changeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension SleepCell {
    func setCell() {
        backgroundColor = .black
        
        alarmLabel.textColor = .darkGray
        
        changeButton.backgroundColor = .darkGray
        changeButton.setTitle("변경", for: .normal)
        changeButton.tintColor = .systemOrange
        changeButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.15).isActive = true
        
        // (bug) sroll 하니까 좀 변함
        changeButton.layer.cornerRadius = changeButton.bounds.size.width * 0.3
    }
}
