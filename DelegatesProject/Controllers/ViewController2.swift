//
//  ViewController2.swift
//  DelegatesProject
//
//  Created by Ildar Zalyalov on 02.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITextFieldDelegate {
    var textOfTextLabel: String = ""
    var dataTransferDelegate: DataTransferProtocol?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = textOfTextLabel
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let text = textField.text,
              !text.isEmpty
        else { return false }
        
        
        dataTransferDelegate?.didPressReturn(with: text)
        navigationController?.popToRootViewController(animated: true)
        
        return true
    }

}
