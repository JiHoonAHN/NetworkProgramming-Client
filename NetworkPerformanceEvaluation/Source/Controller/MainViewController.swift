//
//  ViewController.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/27.
//

import UIKit

class MainViewController: BaseVc {
  
    private let bgView = UIView().then{
        $0.backgroundColor = .nuv_MainColor
    }
    private let logo = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "")
    }
    
    override func configure() {
        super.configure()
        addView()
        location()
    }
    private func addView(){
        [bgView].forEach{view.addSubview($0)}
    }
    private func location(){
        bgView.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(bounds.height/3.274)
        }
    }
    
}

