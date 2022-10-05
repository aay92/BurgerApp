//
//  ViewController.swift
//  BurgerApp
//
//  Created by Aleksey Alyonin on 05.10.2022.
//

import UIKit

class ViewController: UIViewController {

    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сделать заказ", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrane()
    }
    
    func setupViews(){
        view.backgroundColor = .white
        title = "BurgerMarket"
        
        view.addSubview(orderButton)
    }

    func setConstrane(){
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: orderButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60),
            NSLayoutConstraint(item: orderButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 370),
            NSLayoutConstraint(item: orderButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -50),
            NSLayoutConstraint(item: orderButton, attribute:.centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
        ])
        
//        orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -110)
//        orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
////        orderButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 215).isActive = true
////        orderButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
//        orderButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
//        orderButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }


