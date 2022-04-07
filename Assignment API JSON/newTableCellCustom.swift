//
//  newTableCellCustom.swift
//  Assignment API JSON
//
//  Created by coditas on 07/04/22.
//

import UIKit

class newTableCellCustom: UITableViewCell {
    @IBOutlet weak var imageavatar: UIImageView!
    @IBOutlet weak var label1login: UILabel!
    @IBOutlet weak var label2score: UILabel!
    @IBAction func viewDetailbutton(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
