//
//  MakeLectureViewController.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit
class MakeLectureViewController : BaseVc{
    
    private let navigationBar = NavigationBarCustom()
    private let subjectTf = CustomTF(type: "과목")
    private let lectureTf = CustomTF(type: "강의")
    private let contentTf = CustomTF(type: "설명")
    private let btn = UIButton().then{
        $0.backgroundColor = .nuv_MainColor
        $0.layer.cornerRadius = 20
        $0.setTitle("과제 만들기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Light", size: 13)

    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [subjectTf,lectureTf,contentTf]).then{
        $0.spacing = 24
        $0.distribution = .fillEqually
        $0.axis = .vertical
    }
    
    override func configure() {
        super.configure()
        addView()
        location()
    }
    private func addView(){
        [navigationBar,stackView,btn].forEach{view.addSubview($0)}
    }
    private func location(){
        navigationBar.snp.makeConstraints{
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(62)
        }
        stackView.snp.makeConstraints{
            $0.top.equalTo(navigationBar.snp.bottom).offset(122)
            $0.height.equalTo(180)
            $0.left.right.equalToSuperview().inset(40)
        }
        btn.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(60)
            $0.height.equalTo(50)
            $0.left.right.equalToSuperview().inset(40)
        }
    }
}
