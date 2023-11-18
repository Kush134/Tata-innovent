//
//  FYPViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 20/02/23.
//

import UIKit

class FYPViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    
    @IBOutlet weak var fypTableView: UITableView!
    
    var posts: [Post]?
    
    struct Storyboard {
        static let postCell = "FYPPostCell"
        static let postHeaderCell = "FYPPostHeaderCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.fypTableView.dataSource = self
        self.fypTableView.delegate = self
        self.fetchPosts()
    }
    
    func fetchPosts() {
        posts = Post.fetchPosts()
        fypTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let posts = posts {
            return posts.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            return 1
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postCell, for: indexPath) as! FYPPostTableViewCell

        cell.post = posts?[indexPath.section]
        cell.postModelImageView.image = UIImage(named: cell.post.image)
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.postHeaderCell) as! FYPPostHeaderTableViewCell
        
        cell.post = posts?[section]
        cell.profileImageView.image = UIImage(named: cell.post.createdBy.profileImageView)
        cell.usernameButton.titleLabel?.text = cell.post.createdBy.username
        cell.locationButton.titleLabel?.text = cell.post.createdBy.location
        return cell
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
