//
//  PopoverViewController.swift
//  ViewCodeTest
//
//  Created by Rennan Rebouças on 25/11/18.
//  Copyright © 2018 Rennan Rebouças. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    
    let popovertxt: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textColor = .black
        labelView.text = "goku UI"
        labelView.textAlignment = .center
        
        return labelView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(popovertxt)
        layoutText()
    }
    
    
    func layoutText()  {
        popovertxt.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popovertxt.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    


}
