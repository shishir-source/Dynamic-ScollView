//
//  ViewController.swift
//  dynamic scrollview
//
//  Created by Shishir Ahmed on 10/7/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

private let cellId = "CellId"
private let headerId = "headerId"
private let categoryHeaderId = "categoryHeaderId"

class ViewController: UIViewController {
    
//    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionViewLayout()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.collectionView.reloadData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.collectionView.removeObserver(self, forKeyPath: "contentSize")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        if keyPath == "contentSize" {

            if let newValue = change?[.newKey]{
                let newSize = newValue as! CGSize
                self.tableViewHeight.constant = newSize.height
                print(newSize.height)
            }
        }
    }

}

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TestCell {
//            cell.labelText.text = "Test Cell \(indexPath.row)"
//            return cell
//        }
//
//        return UITableViewCell()
//    }
//
//
//}


extension ViewController {
    
    private func createLayout() -> UICollectionViewLayout {
           
       let layout = UICollectionViewCompositionalLayout{(sectionNumber, env) -> NSCollectionLayoutSection? in
           
            if sectionNumber == 0{
               
               let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalWidth(0.25)))
                item.contentInsets.leading = 5
                item.contentInsets.trailing = 5
                item.contentInsets.bottom = 10
    
               let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(150)), subitems: [item])
               let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
               
               section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
               ]
               
               return section
           }else if sectionNumber == 2{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 5
                item.contentInsets.leading = 5
                
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(125)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)

                section.orthogonalScrollingBehavior = .continuous
            
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
                ]
            
                return section
           }
            
           else{
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(250)))
                item.contentInsets.bottom = 10
                item.contentInsets.trailing = 5
                item.contentInsets.leading = 5
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1000)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
            
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryHeaderId, alignment: .topLeading)
                ]
            
                
            
                return section
            }
        }

       return layout
   }
   
    private func configureCollectionViewLayout() {

        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        
        collectionView.register(SliderCell.nib(), forCellWithReuseIdentifier: SliderCell.identfier )
        collectionView.register(Header.self, forSupplementaryViewOfKind: categoryHeaderId, withReuseIdentifier: headerId)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! Header
        
        if indexPath.section == 1 {
            header.label.text = "Featured"
        }
        
        if indexPath.section == 2{
            header.label.text = "Best Sells"
        }
    
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.identfier, for: indexPath) as! SliderCell
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
