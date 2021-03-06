//
//  TimeLineViewController.swift
//  SwiftButton1
//
//  Created by 福島浩一郎 on 2019/05/29.
//  Copyright © 2019年 福島浩一郎. All rights reserved.
//

import UIKit
import Firebase

class TimeLineViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    
    var displayName = String()
    var comment = String()
    
    @IBOutlet var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    var userName_Array = [String]()
    var comment_Array = [String]()
    
    var posts = [Post]()
    var posst = Post()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        refreshControl.attributedTitle = NSAttributedString(string: "引っ張って更新")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.addSubview(refreshControl)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchPost()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for:indexPath)
        
        let userNameLabel = cell.viewWithTag(1) as! UILabel
        userNameLabel.text = self.posts[indexPath.row].userName
        
        let commentLabel = cell.viewWithTag(2) as! UILabel
        commentLabel.text = self.posts[indexPath.row].comment
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 143
    }
    
    @objc func refresh(){
        
        fetchPost()
        refreshControl.endRefreshing()
    }
    
    func fetchPost(){
        
        self.userName_Array = [String]()
        self.comment_Array = [String]()
        self.posst = Post()
        
        let ref = Database.database().reference()
        ref.child("post").observeSingleEvent(of: .value)
        { (snap,error) in
            
            let postsSnap = snap.value as? [String:NSDictionary]
            
            if postsSnap == nil{
                return
            }
            
            self.posts = [Post]()
 
            for (_,post) in postsSnap!{
                
                self.posst = Post()
                
                if let comment = post["comment"] as? String,let userName = post["userName"] as? String{
                    
                    self.posst.comment = comment
                    self.posst.userName = userName
                    
                    self.comment_Array.append(self.posst.comment)
                    self.userName_Array.append(self.posst.userName)
                }
                
                self.posts.append(self.posst)
            }
            
            self.tableView.reloadData()
        }
    }
}
