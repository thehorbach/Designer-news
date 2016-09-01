//
//  LoginVC.swift
//  DNApp
//
//  Created by Vyacheslav Horbach on 28/08/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var dialogView: DesignableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonPressed(sender: UIButton) {
        dialogView.animation = "shake"
        dialogView.animate()
    }
    
    @IBAction func closeButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
