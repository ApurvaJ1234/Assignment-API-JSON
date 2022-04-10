//
//  User Detail.swift
//  Assignment API JSON
//
//  Created by coditas on 10/04/22.
//

import UIKit

class User_Detail: UIViewController {
    @IBOutlet weak var imageUserDetail: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDesc: UILabel!
    @IBOutlet weak var repoURL: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    @IBOutlet weak var repoCreatedOn: UILabel!
    
    
    
    @IBAction func ViewProfileUser(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageUserDetail.layer.cornerRadius = imageUserDetail.frame.size.height/2
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
