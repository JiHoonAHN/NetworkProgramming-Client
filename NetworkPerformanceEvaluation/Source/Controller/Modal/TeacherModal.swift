//
//  TeacherModal.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit
protocol TeacherModalDelegate :AnyObject{
    func updateTeachertModal(placeholder : String)
}

class TeacherModal : BaseModal{
    
    weak var delegate : TeacherModalDelegate?
    private let bgView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    private let titleLabel = UILabel().then{
        $0.text = "교사 키번호"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    }
    private let tf = ModalTF(placeholder: "키번호를 입력해주세요")
    private let btn = UIButton().then{
        $0.backgroundColor = .nuv_MainColor
        $0.layer.cornerRadius = 10
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        $0.addTarget(self, action: #selector(teacherLoginBtn), for: .touchUpInside)
    }
    
    //모달 위치 조정
    static func instance() -> TeacherModal{
        return TeacherModal(nibName: nil, bundle: nil).then{
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    @objc private func teacherLoginBtn(){
        dismiss(animated: true) {
            self.delegate?.updateTeachertModal(placeholder: self.tf.text ?? "")
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
        [titleLabel,tf,btn].forEach{bgView.addSubview($0)}
    }
    private func location(){
        bgView.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(210)
            $0.width.equalTo(330)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(42)
            $0.left.equalToSuperview().offset(32)
        }
        tf.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(27)
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        btn.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(19)
            $0.right.equalToSuperview().inset(24)
            $0.width.equalTo(82)
            $0.height.equalTo(32)
        }
    }
}
