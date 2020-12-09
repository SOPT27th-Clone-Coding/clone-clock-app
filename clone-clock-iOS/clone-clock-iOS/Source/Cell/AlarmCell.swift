//
//  AlarmCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/06.
//

import UIKit

class AlarmCell: UITableViewCell {
    static let identifier = "AlarmCell"

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var colonLabel: UILabel!
    @IBOutlet weak var alarmLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            setColor(color: .white)
        } else {
            setColor(color: .gray)
        }
    }
}

extension AlarmCell {
    func setCell(alarm: AlarmModel) {
        var color: UIColor = .white
        if (!alarm.status) {
            color = .gray
        }

        backgroundColor = .black
        setColor(color: color)
        
        hourLabel.text = "\(alarm.hour)"
        minLabel.text = "\(alarm.min)"
        meridiemLabel.text = "\(alarm.meridiem)"
        statusSwitch.isOn = alarm.status
        
        meridiemLabel.sizeToFit()
        minLabel.sizeToFit()
        hourLabel.sizeToFit()
    }
    
    func setColor(color: UIColor) {
        hourLabel.textColor = color
        minLabel.textColor = color
        meridiemLabel.textColor = color
        colonLabel.textColor = color
        alarmLabel.textColor = color
    }
}
