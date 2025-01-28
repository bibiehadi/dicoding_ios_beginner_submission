//
//  PokemonSkillsTableViewCell.swift
//  PokemonApp
//
//  Created by Bibie Hadi Kusuma on 28/01/25.
//

import UIKit

class PokemonSkillsTableViewCell: UITableViewCell {

    @IBOutlet weak var skillNameLabel: UILabel!
    @IBOutlet weak var skillImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
