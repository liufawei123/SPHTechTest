//
//  ViewController.swift
//  SPHTechTest
//
//  Created by yuanchun tang on 18/8/2019.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        apiManagerInstance.datastoreSearch("a807b7ab-6cad-4aa6-87d0-e283a7353a0f", 10) { (data, error) in
            
        }
    }
}

