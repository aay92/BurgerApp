//
//  ViewController.swift
//  BurgerApp
//
//  Created by Aleksey Alyonin on 05.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
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
    
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrane()
        setDelegates()
    }
    
    func setupViews(){
        view.backgroundColor = .white
        title = "BurgerMarket"
        
        view.addSubview(orderButton)
        view.addSubview(collectionView)
        
        collectionView.register(SaleCollectionViewCell.self,
                                forCellWithReuseIdentifier: SaleCollectionViewCell.indicator)
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.indicator)
        collectionView.register(ExampleCollectionViewCell.self,
                                forCellWithReuseIdentifier: ExampleCollectionViewCell.indicator)
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func setDelegates(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setConstrane(){
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            orderButton.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: orderButton.topAnchor, constant: -10)
        ])
    }
}
//MARK: - Create Layout
extension ViewController {
    private func createLayout()-> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] sectionsIndex, _ in
            guard let self = self else { return nil }
            let section = self.sections[sectionsIndex]
            switch section {

            case .sales(_):
                return self.createSaleSection()
            case .category(_):
                return self.createCategorySection()
            case .example(_):
                return self.createExampleSection()
            }
        }
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup, behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem],
                                     contentInsets: Bool)-> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = contentInsets
        return section
        
    }
    
    private func createSaleSection()-> NSCollectionLayoutSection{
//        размеры секции, группы и айтема
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [],
                                          contentInsets: false)
        
        section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 0)
        return section
    }
    
    private func createCategorySection()-> NSCollectionLayoutSection{
//        размеры секции, группы и айтема
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.2)), subitems: [item])
        group.interItemSpacing = .flexible(10)
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func createExampleSection()->NSCollectionLayoutSection{
//        размеры секции, группы и айтема
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(0.45)), subitems: [item])
        let section = createLayoutSection(group: group,
                                          behavior: .continuous ,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [supplementaryHeaderItem()],
                                          contentInsets: false)
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func supplementaryHeaderItem()->NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch sections[indexPath.section] {
        case .sales(let sale):
            guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaleCollectionViewCell.indicator, for: indexPath) as? SaleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
//            cell.configureCell(name: sale[indexPath.row].images)
            cell.configureCellFake(name: sale[indexPath.row].title)
            return cell
            
        case .category( let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.indicator, for: indexPath) as? CategoryCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].images)

            return cell
            
        case .example( let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExampleCollectionViewCell.indicator, for: indexPath) as? ExampleCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: example[indexPath.row].images)
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
