//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by sazzad on 12/19/16.
//  Copyright © 2016 Dynamic Solution Innovators. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import RxAlamofire

class ViewController: UIViewController {
    
    @IBAction func nextButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "next", sender: sender)
    }
    let sourceStringURL = "http://ec2-54-169-119-131.ap-southeast-1.compute.amazonaws.com:8080/api/auth"
    let disposeBag = DisposeBag()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters: Parameters = [
            "username": "sazzad",
            "password": "123456"
            
            ]
        
        RxAlamofire.requestJSON(.post, sourceStringURL,parameters: parameters,encoding: JSONEncoding.default)
            .debug()
            .subscribe(onNext: { [weak self] (r, json) in
                if let dict = json as? [String: AnyObject] {
                    print(dict)
                    self?.doSomethig()
                    print(r.statusCode)
                    
                }
                }, onError: { [weak self] (error) in
                    self?.displayError(error as NSError)
                })
            .addDisposableTo(disposeBag)
        
    }
    
    func displayError(_ error: NSError?) {

    }
    
    func doSomethig(){
        print("+++++++++++++")
        print("+++++++++++++")
        print("+++++++++++++")
        print("dowing somethign")
        print("+++++++++++++")
        print("+++++++++++++")
        print("+++++++++++++")
    }


}

