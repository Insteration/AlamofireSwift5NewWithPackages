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
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
//
//    let parser = String()
    let parser2 = String()
    let parser3 = String()
    let parser4 = Int()
    let parser5 = Int()
//    let parser4 = Int()
//    let buba = String()
    
    private func getResult() -> DataRequest {
        
        return AF.request("http://jsonplaceholder.typicode.com/posts").responseJSON { responseJSON in
            
            switch responseJSON.result {
            case .success(let value):
                print("\(value)")
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
            
            .downloadProgress { (progress) in
                print("totalUnitCount:\n", progress.totalUnitCount)
                print("completedUnitCount:\n", progress.completedUnitCount)
                print("fractionCompleted:\n", progress.fractionCompleted)
                print("localizedDescription:\n", progress.localizedDescription!)
                print("---------------------------------------------")
                
                self.progressView.progress = Float(progress.fractionCompleted)
            }
        
            .response { (response) in
                
                guard let data = response.data, let image = UIImage(data: data) else { return }
                self.imageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.width
        //        getResult()
        //        checkStatus()
        getPicture()
    }
    
    
    
    
}

