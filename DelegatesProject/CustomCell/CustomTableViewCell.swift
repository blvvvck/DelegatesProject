//
//  CustomTableViewCell.swift
//  DelegatesProject
//
//  Created by Ildar Zalyalov on 02.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

protocol CustomCellTransferProtocol {
    func didPressedLikeButton()
}

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customtextLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var customCellTransferDelegate: CustomCellTransferProtocol?
    
    func prepare(with text: String, delegate: CustomCellTransferProtocol?) {
        
        customtextLabel.text = text
        customCellTransferDelegate = delegate
    }
    
    @IBAction func likeButtonPressed(_ likeButton: UIButton) {
        let buttonText = likeButton.isSelected ? "liked" : "unliked"
        likeButton.isSelected = !likeButton.isSelected
        
        likeButton.setTitle(buttonText, for: .normal)
        customCellTransferDelegate?.didPressedLikeButton()
    }
    
}
