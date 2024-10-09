//
//  JokeCell.swift
//  jokeapp2
//
//  Created by admin on 09/09/24.
//

import UIKit

class JokeCell: UITableViewCell {

    @IBOutlet weak var idlable: UILabel!
    @IBOutlet weak var puchlinelable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var setuplable: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
