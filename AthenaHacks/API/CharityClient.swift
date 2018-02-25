//
//  CharityClient.swift
//  AthenaHacks
//
//  Created by Sarah Gemperle on 2/24/18.
//  Copyright © 2018 Allison Reiss. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class CharityClient: BDBOAuth1SessionManager {
    
    func getCategories() {
        let apikey = "6036d915f121c7d50b8f3d7bcc93796f"
        let url = URL(string: "http://data.orghunter.com/v1/categories?user_key=\(apikey)")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let data = data {
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(dataDictionary)
                    
                    print(dataDictionary)
                   
                }
            }
        }
    }

    
}
