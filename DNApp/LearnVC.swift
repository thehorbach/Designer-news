//
//  LearnVC.swift
//  DNApp
//
//  Created by Vyacheslav Horbach on 28/08/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class LearnVC: UIViewController {
    
    @IBOutlet weak var dialogView: DesignableView!
    @IBOutlet weak var imageView: SpringImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        dialogView.animate()
    }
    
    @IBAction func learnButtonPressed (sender: UIButton) {
        imageView.animation = "pop"
        imageView.animate()
    }
    
    @IBAction func backButtonPressed (sender: UIButton) {
        dialogView.animation = "fall"
        dialogView.animateNext { 
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
