//
//  RecordedSoundCellTableViewCell.swift
//  NyanNote
//
//  Created by user on 2024/02/02.
//

import UIKit

class RecordedSoundCell: UITableViewCell {
    
    @IBOutlet weak var soundName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
