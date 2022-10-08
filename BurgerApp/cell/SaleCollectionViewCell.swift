//
//  SaleCollectionViewCell.swift
//  BurgerApp
//
//  Created by Aleksey Alyonin on 06.10.2022.
//

import Foundation
import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
    static let indicator = "StoriesCollectionViewCell"
    private let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setupView(){
        backgroundColor = .white
        addSubview(saleImageView)
    }
    func configureCell(name: String){
        saleImageView.image = UIImage(named: name)
    }
    func configureCellFake(name: String){
        saleImageView.image = UIImage(systemName: name)
        print(name)
    }
     func setConstraints(){
         NSLayoutConstraint.activate([
            saleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            saleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
         ])
    }
}
