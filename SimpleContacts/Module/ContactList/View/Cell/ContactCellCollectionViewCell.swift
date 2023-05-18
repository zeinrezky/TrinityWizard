//
//  ContactCellCollectionViewCell.swift
//  SimpleContact
//
//  Created by Zein Rezky Chandra on 18/05/23.
//

import UIKit

class ContactCellCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureView: UIView!
    var name: String = ""

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.text = name
        pictureView.layer.cornerRadius = pictureView.bounds.height / 2
        
    }

}
