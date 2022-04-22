//
//  userDetail.swift
//  Assignment API JSON
//
//  Created by coditas on 10/04/22.
//

import UIKit

class userDetail: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var nodeId: UILabel!
    @IBOutlet weak var accURL: UILabel!
    
    @IBOutlet weak var repoURL: UILabel!
    @IBOutlet weak var accType: UILabel!
    
    var newItems: Items?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userImage.layer.cornerRadius = userImage.frame.size.height/2
        
        let idnew = newItems?.id
        userId.text = String(describing: idnew!)
        
        nodeId.text = newItems?.node_id
        
        
        
        userName.text = newItems?.login
       
        let urlacc = newItems?.url
        accURL.text = (String(describing:urlacc!))
        
        let urlrepo = newItems?.repos_url
        repoURL.text = (String(describing:urlrepo!))
        
        accType.text = newItems?.type
        
        let imageUrl = newItems?.avatar_url
        let imageData = try! Data(contentsOf: imageUrl!)
        let image = UIImage(data: imageData)
        userImage.image = image
        
        
        
  
    }
    

}

