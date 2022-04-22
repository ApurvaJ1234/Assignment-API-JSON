//
//  ViewController.swift
//  Assignment API JSON
//
//  Created by coditas on 05/04/22.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func viewDetailFirst(_ sender: Any) {
       // let det:userDetail=self.storyboard?.instantiateViewController(withIdentifier: "det") as!userDetail

        
      //  self.navigationController?.pushViewController(det, animated: true)
    }
    
   var newlogin : String?
    var y : String?
    @IBOutlet weak var searchBar: UISearchBar!
    
    //var new : String!
    var userData = [Items]()
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            
          //  searchBar1()
            searchBar.delegate = self
            
        }
        
        
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            y = searchBar.text!
            ParsingJson { data in
                self.userData = data
                DispatchQueue.main.async {
                    self.tableView.reloadData()
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
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "newTableCellCustom") as! newTableCellCustom
            cell.label1login.text = userData[indexPath.row].login
            newlogin = userData[indexPath.row].login
            cell.label2score.text = "Score: "+String(userData[indexPath.row].score)
            
            
            
            let firstURL = userData[indexPath.row].avatar_url.absoluteString
            
            

            let imageUrl = URL(string:firstURL )!

            let imageData = try! Data(contentsOf: imageUrl)

            let image = UIImage(data: imageData)

            cell.imageavatar?.image = image
            cell.isHidden = indexPath.row > 20
            return cell
        }
        

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newOne", sender: viewDetailFirst)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? userDetail{
            destination.newItems = userData[tableView.indexPathForSelectedRow?.row ?? 0]
        }
    }
        func ParsingJson(comletion: @escaping ([Items])->()){
            print(y!)

            let urlstring = "https://api.github.com/search/users?q=\(String(describing: y!))"
            
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
                        
                        DispatchQueue.main.async(execute: {
                          // call any function ex. doSomething()
                            // Create new Alert
                            let dialogMessage = UIAlertController(title: "No results found", message: "Search Again?", preferredStyle: .alert)
                            
                            // Create OK button with action handler
                            let ok = UIAlertAction(title: "Search", style: .default, handler: { (action) -> Void in
                                print("Ok button tapped")
                             })
                            
                            //Add OK button to a dialog message
                            dialogMessage.addAction(ok)

                            // Present Alert to
                            self.present(dialogMessage, animated: true, completion: nil)
                         })
                        
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
        var id : Int
        var node_id : String
        var repos_url : URL
        var type : String
    }
