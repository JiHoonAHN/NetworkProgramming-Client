//
//  CustomTF.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit

class CustomTF : UIView{
        private let typeLabel = UILabel().then{
            $0.textColor = .black
            $0.font = UIFont(name: "AppleSDGothicNeo-Light", size: 10)
    }
     let tf = UITextField().then{
        $0.textColor = .black
         $0.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
    }
     let divider = UIView().then{
         $0.backgroundColor = .nuv_MainColor
    }
    init(type: String){
        super.init(frame: .zero)
        addView()
        typeLabel.text = type
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        typeLabel.snp.makeConstraints{
            $0.left.top.equalToSuperview()
        }
        tf.snp.makeConstraints{
            $0.top.equalTo(typeLabel.snp.bottom)
            $0.left.right.equalToSuperview()
        }
        divider.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(2)
        }
        
    }
    private func addView(){
        [typeLabel,divider,tf].forEach{ addSubview($0)}
    }


    }
