//
//  NavigationBarCustom.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit

class NavigationBarCustom : UIView{
    
    let iv = UIImageView().then{
        $0.image = UIImage(named: "Network_Logo")
        $0.contentMode = .scaleAspectFit
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .nuv_MainColor
        addSubview(iv)
        iv.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.width.equalTo(25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
