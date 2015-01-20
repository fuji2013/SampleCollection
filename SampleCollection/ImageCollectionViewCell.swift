//
//  ImageCollectionViewCell.swift
//  SampleCollection
//
//  Created by fuhi1983 on 2015/01/21.
//  Copyright (c) 2015年 sample. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()  // 画像
    let numLabel = UILabel()  // 何枚目の画像であるか。その数字を表示する
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraint()
    }
    
    // ビューの作成と設定
    private func setupView(){
        self.backgroundColor = UIColor.lightGrayColor()
        imageView.contentMode = UIViewContentMode.ScaleToFill
        numLabel.textAlignment = NSTextAlignment.Center
        numLabel.font = UIFont.boldSystemFontOfSize(40.0)
        numLabel.textColor = UIColor.orangeColor()
        self.addSubview(imageView)
        self.addSubview(numLabel)
    }
    
    // 制約の設定
    private func setupConstraint(){
        var viewConstraints = [NSLayoutConstraint]()
        
        // imageView
        imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        viewConstraints.append(NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: imageView, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        
        // numLabel
        numLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        var numLabelConstraints = [NSLayoutConstraint]()
        numLabelConstraints.append(NSLayoutConstraint(item: numLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 40.0))
        viewConstraints.append(NSLayoutConstraint(item: numLabel, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: numLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
        viewConstraints.append(NSLayoutConstraint(item: numLabel, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
        
        numLabel.addConstraints(numLabelConstraints)
        self.addConstraints(viewConstraints)
    }
    
    // コンテンツの表示
    func setupContents(num:Int, filePath:String){
        numLabel.text = "\(num)"
        imageView.image = UIImage(named: filePath)
    }
}
