//
//  ViewController.swift
//  AboutMe
//
//  Created by Oquba Khan on 7/19/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutLabel.sizeToFit()
    }


}

