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
    
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDesc: UILabel!
    @IBOutlet weak var repoURL: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    @IBOutlet weak var repoCreatedOn: UILabel!
    
    var newItems: Items?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userImage.layer.cornerRadius = userImage.frame.size.height/2
        
       // userImage = URL(string:firstURL )!
        userName.text = newItems?.login
       // repoName.text = newItems?.
        //let urlme = newItems?.url
       // repoURL.text = urlme
       // repoLanguage = newItems?.
       // repoCreatedOn = newItems?.\
        let imageUrl = newItems?.avatar_url

        let imageData = try! Data(contentsOf: imageUrl!)

        let image = UIImage(data: imageData)

        userImage.image = image
        
        
        
        // Do any additional setup after loading the view.
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
