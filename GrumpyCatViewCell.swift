//
//  GrumpyCatViewCell.swift
//  GrumpyCatTable
//
//  Created by Robert Martin on 9/2/16.
//

import UIKit

class GrumpyCatViewCell: UITableViewCell {

    @IBOutlet weak var thingToHate: UILabel!
    @IBOutlet weak var grumpyCat: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
