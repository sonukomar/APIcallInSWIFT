//
//  ViewController.swift
//  helloWorld
//
//  Created by RITIKASINGH on 04/03/1940 Saka.
//  Copyright © 1940 RITIKASINGH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var MylTextBox: UITextField!
    
    @IBAction func button(_ sender: Any) {
        
        //getting ready for making an api call to git hub
//        let params = ["username":"sonukomar", "password":"123456"] as Dictionary<String, String>
        
        var responseData: Dictionary<String, AnyObject>
        
        var request = URLRequest(url: URL(string: "https://api.github.com/user")!)
        request.httpMethod = "GET"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        print(request)
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            print(data!)
            do {
                responseData = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(responseData)
            } catch {
                print("error")
            }
        })
        
        task.resume()
        helloLabel.text = responseData.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

