//
//  CheckBox.swift
//  Hack Challenge
//
//  Created by Pinxuan Huang on 11/25/18.
//  Copyright © 2018 Cameron Hamidi. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "img_checked")! as UIImage
    let uncheckedImage = UIImage(named: "img_unchecked")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
