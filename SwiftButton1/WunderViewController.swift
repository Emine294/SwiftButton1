//
//  WunderViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/04/29.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class WunderViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate{
    
    @IBOutlet var backImageView: UIImageView!
    
    @IBOutlet var backView: UIView!

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var textField: UITextField!
    
    var titleArray = [String]()
    
    var label:UILabel = UILabel()
    
    var count:Int = 0
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84.5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.layer.cornerRadius = 10.0
        label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = titleArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        count = Int(indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            
            let nextVC:WunderNextViewController = segue.destination as! WunderNextViewController
            
            nextVC.selectedNumber = count
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            
            titleArray.remove(at: indexPath.row)
            
            UserDefaults.standard.set(titleArray, forKey: "array")
            
            tableView.reloadData()
        }else if editingStyle  == .insert{
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
        backView.layer.cornerRadius = 2.0
        
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {


        if UserDefaults.standard.object(forKey: "array") != nil{
            
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
        }
        
        if UserDefaults.standard.object(forKey: "image") != nil{
            
            let numberString = UserDefaults.standard.string(forKey: "image")
            
            backImageView.image = UIImage(named: numberString! + ".jpg")

        }
        
        tableView.reloadData()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        titleArray.append(textField.text!)
    
        UserDefaults.standard.set(titleArray, forKey: "array")
    
        if UserDefaults.standard.object(forKey: "array") != nil{
            
            titleArray = UserDefaults.standard.object(forKey: "array") as! [String]
        
            textField.text = ""
            tableView.reloadData()
        }
        
        textField.resignFirstResponder()
        
        return true
    }
 
}
