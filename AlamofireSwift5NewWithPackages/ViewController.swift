//
//  ViewController.swift
//  AlamofireSwift5NewWithPackages
//
//  Created by Артём Кармазь on 6/26/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    private func getResult() -> DataRequest {
        
        return AF.request("http://jsonplaceholder.typicode.com/posts").responseJSON { responseJSON in
            
            switch responseJSON.result {
            case .success(let value):
                print("\(value)")
                
                //                guard let jsonArray = responseJSON.result as? [[String: Any]] else { return }
                //                print("Array, \(jsonArray)")
                //                print("1 object \(jsonArray[0])")
                //                print("1 id \(jsonArray[0]["id"]!)")
                
            case .failure(let error):
                print("\(error)")
                
            }
        }
    }
    
    private func checkStatus() {
        AF.request("http://jsonplaceholder.typicode.com/posts").responseJSON { responseJSON in
            
            guard let statusCode = responseJSON.response?.statusCode else { return }
            print("Status code = \(statusCode)")
            
            if (200..<300).contains(statusCode) {
                let value = responseJSON.result
                print("value = \(value)")
            } else {
                print("error")
            }
            
            print("status code = \(statusCode)")
        }
    }
    
    private func getPicture() {
        AF.request("https://s-media-cache-ak0.pinimg.com/originals/ef/6f/8a/ef6f8ac3c1d9038cad7f072261ffc841.jpg").validate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getResult()
//        checkStatus()
        getPicture()
    }
    
   
    
    
}

