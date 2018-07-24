//
//  TableViewCell.swift
//  Student-Data
//
//  Created by Anand on 23/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var studentTextField: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var detailsViewHeight: NSLayoutConstraint!
    
    public func configure(text: String?, placeholder: String) {
        studentTextField.text = text
        studentTextField.placeholder = placeholder
        
        studentTextField.accessibilityValue = text
        studentTextField.accessibilityLabel = placeholder
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
