//
//  ExampleCollectionViewCell.swift
//  BurgerApp
//
//  Created by Aleksey Alyonin on 06.10.2022.
//

import Foundation
import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    static let indicator = "ComingSoonCollectionViewCell"

    private let burgerNameView: UIImageView = {
        let burgerName = UIImageView()
        burgerName.contentMode = .scaleAspectFit
        burgerName.backgroundColor = .white
        burgerName.image = UIImage(named: "burger1")
        burgerName.translatesAutoresizingMaskIntoConstraints = false
        burgerName.layer.cornerRadius = burgerName.bounds.size.height / 2
        return burgerName
    }()
    
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.alpha = 0.6
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Egg Top Burger"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$12.3"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial Bold", size: 24)
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView(){
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview(backgroundTitleView)
        addSubview(burgerNameView)
        addSubview(nameLabel)
        addSubview(priceLabel)

    }
    
    func configureCell(imageName: String){
        burgerNameView.image = UIImage(named: imageName)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
           
//            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: backgroundTitleView.bottomAnchor, constant: -18),
            
//            priceLabel.centerXAnchor.constraint(equalTo: backgroundTitleView.centerXAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10),
            priceLabel.bottomAnchor.constraint(equalTo: backgroundTitleView.bottomAnchor, constant: -18),

            
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundTitleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundTitleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, constant: 0.1),
            
            burgerNameView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            burgerNameView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            burgerNameView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerNameView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
           
        ])
    }
}

