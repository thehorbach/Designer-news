//
//  MenuVC.swift
//  DNApp
//
//  Created by Vyacheslav Horbach on 28/08/16.
//  Copyright © 2016 Vyacheslav Horbach. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    @IBOutlet weak var dialogView: DesignableView!
    
    @IBAction func closeButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        
        dialogView.animation = "fall"
        dialogView.animate()
    }
    
}
