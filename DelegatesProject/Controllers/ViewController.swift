//
//  ViewController.swift
//  DelegatesProject
//
//  Created by Ildar Zalyalov on 02.10.2017.
//  Copyright © 2017 ru.itisIosLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellTransferProtocol, DataTransferProtocol {
    fileprivate let identifier = "segue"
    fileprivate let customCellidentifier = "customCell"
    fileprivate let cellIdentifier = "cell"
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var secondTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        firstTableView.register(nib, forCellReuseIdentifier: customCellidentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITableViewDelegate & Datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == firstTableView {
          let cell = tableView.dequeueReusableCell(withIdentifier: customCellidentifier, for: indexPath as IndexPath) as! CustomTableViewCell
            
            cell.prepare(with: "text", delegate: self)
            
            return cell
        }
        else {
           let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    
    //MARK: Prepare method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == identifier {
            let destinationController = segue.destination as! ViewController2
            
            destinationController.textOfTextLabel = "text"
            destinationController.dataTransferDelegate = self
        }
    }
    
    //MARK: CustomCellTransferProtocol
    
    func didPressedLikeButton() {
        performSegue(withIdentifier: identifier, sender: nil)
    }
    
    //MARK: DataTrasferProtocol
    
    func didPressReturn(with text: String) {
        textLabel.text = text
    }
    
    //MARK: Buttons action
    
    @IBAction func actionButtonPressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "My Alert", message: "", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            self.navigationItem.title = "My title"
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

