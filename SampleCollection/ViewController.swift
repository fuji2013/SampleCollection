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
    let flowLayout = UICollectionViewFlowLayout()
    let imageItems = ["arrow73.png", "clock96.png", "close13.png", "email20.png", "garbage12.png", "handshake1.png"]  // 4.CollectionViewにAutoLayoutを使用したカスタムセルを表示する   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // レイアウト作成
        flowLayout.scrollDirection = .Vertical
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.itemSize = CGSizeMake(100, 100)
        flowLayout.headerReferenceSize = CGSizeMake(0, 50)
        
        // コレクションビュー作成
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        collectionView.registerClass(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCell")  // 4.CollectionViewにAutoLayoutを使用したカスタムセルを表示する
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
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
    
    // 回転を有効にするか
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    // 回転できる方向
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.rawValue) // 値がUIntなので、Int型に変換
    }
    
    // 画面回転する前の処理
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        // 縦画面では縦にスクロール、横画面では横にスクロールする。
        // 処理が行われたかわかりにくいので、collectionViewの背景色を画面方向によって変更
        if toInterfaceOrientation == .Portrait
            || toInterfaceOrientation == .PortraitUpsideDown{
                
                flowLayout.scrollDirection = .Vertical
                collectionView.backgroundColor = UIColor.blackColor()
                
        }else if toInterfaceOrientation == .LandscapeLeft
            || toInterfaceOrientation == .LandscapeRight{
                
                flowLayout.scrollDirection = .Horizontal
                collectionView.backgroundColor = UIColor.whiteColor()
                
        }else{
            // 画面回転方向がunknownのときは縦にスクロール
            flowLayout.scrollDirection = .Vertical
            collectionView.backgroundColor = UIColor.orangeColor()
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count  // 4.CollectionViewにAutoLayoutを使用したカスタムセルを表示する
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as ImageCollectionViewCell
        cell.setupContents(indexPath.row, filePath:imageItems[indexPath.row])
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerReusableView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as UICollectionReusableView
        headerReusableView.backgroundColor = UIColor.blueColor()
        
        return headerReusableView
    }
}

