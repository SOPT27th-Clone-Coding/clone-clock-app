//
//  TimerSoundOptionCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/12/22.
//

import UIKit

class TimerSoundOptionCell: UITableViewCell {
    @IBOutlet weak var checkMarkImage: UIImageView!
    @IBOutlet weak var soundName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        checkMarkImage.image = selected ? UIImage(systemName: "checkmark") : .none
        checkMarkImage.tintColor = .systemOrange
    }
}

extension TimerSoundOptionCell {
    func setCell(name: String) {
        soundName.text = name
        soundName.sizeToFit()
        
        soundName.textColor = .white
        self.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
    }
}
