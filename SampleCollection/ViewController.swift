//
//  ViewController.swift
//  SampleCollection
//
//  Created by fuhi1983 on 2015/01/17.
//  Copyright (c) 2015年 sample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // レイアウト作成
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Vertical
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.itemSize = CGSizeMake(100, 100)
        flowLayout.headerReferenceSize = CGSizeMake(0, 50)  // 2.ヘッダー追加のため
        
        // コレクションビュー作成
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")  // 2.ヘッダー追加のため
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        // AutoLayout制約を追加
        setupConstraints()
    }
    
    private func setupConstraints(){
        var viewConstraints = [NSLayoutConstraint]()
        
        // コレクションビューの制約
        collectionView.setTranslatesAutoresizingMaskIntoConstraints(false)
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: collectionView, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        
        // ビューに制約を追加
        view.addConstraints(viewConstraints)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    // 2.ヘッダー追加のため
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as UICollectionReusableView
        headerReusableView.backgroundColor = UIColor.blueColor()
        
        return headerReusableView
    }
}

