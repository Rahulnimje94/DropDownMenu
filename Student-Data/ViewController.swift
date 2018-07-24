//
//  ViewController.swift
//  Student-Data
//
//  Created by Anand on 23/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.tableFooterView = UIView()
            tableView.estimatedRowHeight = 44.0
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    
    var array = [[String: Any]]()

    enum Details: Int{
        case expand = 134
        case close = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialTableSetUp()
    }

    func initialTableSetUp(){
        array = [["expand": false, "name": "", "dob": "", "address": ""],
                 ["expand": false, "name": "", "dob": "", "address": ""],
                 ["expand": false, "name": "", "dob": "", "address": ""],
                 ["expand": false, "name": "", "dob": "", "address": ""],
                 ["expand": false, "name": "", "dob": "", "address": ""]]
        tableView.reloadData()
    }

    @IBAction func actionExpandCell(_ sender: UIButton) {
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let model = array[indexPath.row]
        cell.addressTextField.tag = indexPath.row
        cell.studentTextField.tag = indexPath.row
        cell.dobTextField.tag = indexPath.row
        
        guard let expand = model["expand"] as? Bool,
              expand else {
                UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn, animations: {
                    cell.detailsViewHeight.constant = CGFloat(Details.close.rawValue)
                })
            return cell
        }
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseIn, animations: {
            //Table expand
            cell.detailsViewHeight.constant = CGFloat(Details.expand.rawValue)
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var model = array[indexPath.row]
        guard let expand = model["expand"] as? Bool,
            expand else {
                model["expand"] = true
                array[indexPath.row] = model
                tableView.reloadData()
          return
        }
        model["expand"] = false
        array[indexPath.row] = model
        tableView.reloadData()
    }
    
}
