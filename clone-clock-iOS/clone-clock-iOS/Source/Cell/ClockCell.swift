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
    
    // ... cityLabel이 작아지지 않으면서 사라지는 방법을 찾아야함
    override func willTransition(to state: UITableViewCell.StateMask) {
        if (state.contains(.showingEditControl)) {
            timeLabel.isHidden = true
            meridiemLabel.isHidden = true
        }
    }
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        if (state == StateMask.init(rawValue: 0)) {
            timeLabel.isHidden = false
            meridiemLabel.isHidden = false
        }
    }
    
}

extension ClockCell {
    func setCell(clock: ClockModel) {
        timeLabel.text = clock.time
        meridiemLabel.text = clock.meridiem
        cityLabel.text = clock.city
        cityLabel.preferredMaxLayoutWidth = 190
        diffLabel.text = clock.diff
        
        self.backgroundColor = .black
    }
}
