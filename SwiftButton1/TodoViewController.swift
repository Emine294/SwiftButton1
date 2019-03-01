//
//  TodoViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/03/02.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    var resultArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.object(forKey: "todo")
        != nil {
            resultArray = UserDefaults.standard.object(forKey: "todo") as! [String]
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
