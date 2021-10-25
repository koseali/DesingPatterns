//
//  MainTableViewCell.swift
//  Tekrar_MVC
//
//  Created by Ali Kose on 19.10.2021.
//
 
import UIKit
//  Error: - Bosa Ciktii

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

