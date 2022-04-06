//
//  ViewController.swift
//  Assignment API JSON
//
//  Created by coditas on 05/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var fetchedLogin = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        parseData()
    }
    func parseData(){
        
        fetchedLogin = []
        
        let url = "https://api.github.com/search/users?q="
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if (error != nil){
                print("Error")
            }
            else{
                do{
                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                    for eachFetchedLogin in fetchedData{
                        let eachLogin = eachFetchedLogin
                        let login = eachLogin["login"]
                        let avatar_url = eachLogin["avatar_url"] as! String
                        let url = eachLogin["url"] as! String
                        let score = eachLogin["score"] as! String
                        
                        self.fetchedLogin.append(User(avatar_url: avatar_url, login: login, score: score, url: url))
                    }
                    print(fetchedData)
                }
                catch{
                    print("Error 2")
                }
            }
        }
        task.resume()
    }

}

class User{
    var avatar_url : String
    var login : String
    var score : String
    var url : String
    
    init(avatar_url: String, login: String, score: String, url: String){
        self.avatar_url = avatar_url
        self.login = login
        self.score = score
        self.url = url
    }
    
}
