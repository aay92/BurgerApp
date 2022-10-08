//
//  MockData.swift
//  BurgerApp
//
//  Created by Aleksey Alyonin on 06.10.2022.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    private let sales: ListSection = {
        .sales([.init(title: "", images: "salesBurger"),
                .init(title: "", images: "salesPizza"),
                .init(title: "", images: "salesWok")])
    }()
    
    private let category: ListSection = {
        .category([.init(title: "Burger", images: "categoryBurger"),
                   .init(title: "Pizza", images: "categoryPizza"),
                   .init(title: "Wok", images: "categoryWok"),
                   .init(title: "Hot-Dog", images: "categoryHot-Dog"),
                   .init(title: "Chicken", images: "categoryChicken"),
                   .init(title: "Taco", images: "categoryTaco")])
    }()
    
    private let example: ListSection = {
        .example([.init(title: "", images: "burger1"),
                .init(title: "", images: "burger2"),
                .init(title: "", images: "burger3")])
    }()
    
    var pageData: [ListSection] {
        [sales, category, example]
    }
}

