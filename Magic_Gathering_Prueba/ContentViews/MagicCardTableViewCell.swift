//
//  MagicCardTableViewCell.swift
//  Magic_Gathering_Prueba
//
//  Created by Francisco Jesus Cedrón Guillermo on 11/10/21.
//

import UIKit

class MagicCardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardManaCost: UILabel!
    @IBOutlet weak var cardPowerValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
