//
//  ViewController.swift
//  ViewCodeTest
//
//  Created by Rennan Rebouças on 25/11/18.
//  Copyright © 2018 Rennan Rebouças. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPopoverPresentationControllerDelegate {

    let gokuImage: UIImageView = {
        let imageName = "goku.png"
        let image = UIImage(named: imageName)
        let imageGoku = UIImageView(image: image!)
        imageGoku.translatesAutoresizingMaskIntoConstraints = false
        imageGoku.layer.cornerRadius = 20
        imageGoku.layer.masksToBounds = true
        return imageGoku
    }()
    
    let fraseGoku: UILabel = {
        let labelView = UILabel()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textColor = .black
        labelView.text = "goku ultra instinto é o melhor de todos"
        labelView.textAlignment = .center
        
        return labelView
    }()
    
    let butaoPopover: UIButton = {
        let buttonPPV = UIButton()
        buttonPPV.translatesAutoresizingMaskIntoConstraints = false
        buttonPPV.backgroundColor = .gray
        buttonPPV.layer.cornerRadius = 5
        buttonPPV.setTitle("popover", for: .highlighted)
        return buttonPPV
    }()
    
    let botao1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gokuImage)
        view.addSubview(fraseGoku)
        view.addSubview(butaoPopover)
        view.addSubview(botao1)
        butaoPopover.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        botao1.addTarget(self, action: #selector(botaoapertado), for: .touchUpInside)
        setupLayoutGoku()
        
     
    }
    @objc func botaoapertado (sender: UIButton){
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "PopoverViewController") as! PopoverViewController
        VC.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        VC.modalPresentationStyle = .popover
        let popover = VC.popoverPresentationController!
        popover.delegate = self
        let width = self.view.frame.width / 4
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: width))
        
        popover.backgroundColor = .white
        popover.canOverlapSourceViewRect = true
        popover.permittedArrowDirections = .right
        popover.sourceView = sender as? UIView
        popover.sourceRect = sender.bounds
        self.present(VC, animated: true, completion:nil)
    }
    
    @objc func buttonPressed(sender: UIButton!)  {
        let VC = storyboard?.instantiateViewController(withIdentifier: "PopoverViewController") as! PopoverViewController
        VC.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
        VC.modalPresentationStyle = .popover
        let popover = VC.popoverPresentationController!
        popover.delegate = self
        popover.permittedArrowDirections = .down
        popover.sourceView = sender as? UIView
        popover.sourceRect = sender.bounds
        self.present(VC, animated: true, completion:nil)
       
        
        
    }
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
    
    func setupLayoutGoku(){
        
        gokuImage.translatesAutoresizingMaskIntoConstraints = false
        gokuImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        imageGoku.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        gokuImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        gokuImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        gokuImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        fraseGoku.topAnchor.constraint(equalTo: gokuImage.bottomAnchor, constant: 0).isActive = true
        fraseGoku.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        fraseGoku.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        fraseGoku.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        butaoPopover.topAnchor.constraint(equalTo: fraseGoku.bottomAnchor, constant: 0).isActive = true
        butaoPopover.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        butaoPopover.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        butaoPopover.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        botao1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        botao1.rightAnchor.constraint(equalTo: gokuImage.leftAnchor, constant: 0).isActive = true
        botao1.heightAnchor.constraint(equalTo: gokuImage.heightAnchor).isActive = true
        botao1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        botao1.topAnchor.constraint(equalTo: gokuImage.topAnchor).isActive = true
        
        
    }
 

}

