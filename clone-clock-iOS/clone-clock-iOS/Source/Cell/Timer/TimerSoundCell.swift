//
//  TimerSoundCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/18.
//

import UIKit

class TimerSoundCell: UITableViewCell {
    @IBOutlet weak var soundLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension TimerSoundCell {
    func setCell() {
        soundLabel.text = "전파 감지기"
        soundLabel.textColor = .systemGray
        
        self.backgroundColor = #colorLiteral(red: 0.3028068841, green: 0.3010125458, blue: 0.304189831, alpha: 0.3198576627)
        self.accessoryType = .disclosureIndicator
    }
}
