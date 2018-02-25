//
//  CharityViewController.swift
//  AthenaHacks
//
//  Created by Allison Reiss on 2/24/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit

class CharityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: NSArray?
    var categorySelected: String?
    var userUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        let apikey = "6036d915f121c7d50b8f3d7bcc93796f"
        let url = URL(string: "https://data.orghunter.com/v1/categories?user_key=\(apikey)")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] {
                    print(dataDictionary)
                    self.categories = dataDictionary["data"] as! NSArray
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as! CharityCategoryCell
        
        if let categories = categories {
            let category = categories[indexPath.row] as! [String:AnyObject]
            cell.charityCategoryLab.text = category["categoryDesc"] as? String
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = categories![indexPath.row] as! [String:AnyObject]
        self.categorySelected = cat["categoryId"] as? String
        print(self.categorySelected)
        performSegue(withIdentifier: "categorySelectedSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ListOfCharitesVC
        destination.categorySelected = self.categorySelected
        destination.userUID = self.userUID
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let categories = categories {
            return categories.count
        } else {
            return 0
        }
    }
    
}
