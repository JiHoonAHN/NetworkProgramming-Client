//
//  TeacherModal.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit

class TeacherModal : BaseModal{
    
    private let bgView = UIView().then{
        $0.backgroundColor = .white
    }
    
    //모달 위치 조정
    static func instance() -> TeacherModal{
        return TeacherModal(nibName: nil, bundle: nil).then{
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    //MARK: - Helper
    override func modalSetting() {
        super.modalSetting()
        addView()
        location()
    }
    private func addView(){
        view.addSubview(bgView)
    }
    private func location(){
        bgView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(229)
            $0.width.equalTo(330)
        }
    }
}
