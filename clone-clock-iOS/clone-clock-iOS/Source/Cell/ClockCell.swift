//
//  ClockCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/27.
//

import UIKit

class ClockCell: UITableViewCell {
    static let identifier = "ClockCell"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func willTransition(to state: UITableViewCell.StateMask) {
//        timeLabel.isHidden = true
//        meridiemLabel.isHidden = true
    }
}

extension ClockCell {
    func setCell(clock: ClockData) {
        timeLabel.text = clock.time
        meridiemLabel.text = clock.meridiem
        cityLabel.text = clock.city
        diffLabel.text = clock.diff
        
        self.backgroundColor = .black
    }
}
