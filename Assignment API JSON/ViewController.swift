//
//  ViewController.swift
//  Assignment API JSON
//
//  Created by coditas on 05/04/22.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    
var userData = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ParsingJson { data in
            self.userData = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        searchBar()
    }
    
    func searchBar(){
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        //searchBar.scopeButtonTitles = ["User"]
        self.tableView.tableHeaderView = searchBar
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            ParsingJson { data in
                self.userData = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else{
                if searchBar.selectedScopeButtonIndex == 0 {
                    
                }else{
                    
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = userData[indexPath.row].login
        cell.textLabel?.text = userData[indexPath.row].login
        return cell
    }
    
    
    func ParsingJson(comletion: @escaping ([Items])->()){
        let urlstring = "https://api.github.com/search/users?q=apurva"
        //let y = searchBarSearchButtonClicked()
        //let new = urlstring + y
        let url = URL(string: urlstring)
        
        guard url != nil else{
            print("Error")
            return
        }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
    
            if error == nil, data != nil{
                let decoder = JSONDecoder()
                do {
                let ParsingData = try decoder.decode(Gitapi.self, from: data!)
                    comletion(ParsingData.items)
                }
                catch {
                    print("Parsing Error")
                }
            }
        }
        dataTask.resume()
        
    }
}

struct Gitapi : Decodable {
    var total_count : Int
    var items : [Items]
    
}
struct Items : Decodable {
    var avatar_url : URL
    var login : String
    var score : Int
    var url : URL
}

