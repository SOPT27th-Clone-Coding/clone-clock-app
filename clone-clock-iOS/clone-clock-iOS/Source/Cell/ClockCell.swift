//
//  ClockCell.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/27.
//

import UIKit

class ClockCell: UITableViewCell {
    static let identifier = "ClockCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ClockCell {
    func setCell() {

    }
    
    func setHeader() {
        let headerLabel = UILabel()
        headerLabel.isHidden = false
        headerLabel.text = "세계 시계"
        headerLabel.textColor = .white
        headerLabel.font = .boldSystemFont(ofSize: 35)

        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(headerLabel)

        headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    }
}
