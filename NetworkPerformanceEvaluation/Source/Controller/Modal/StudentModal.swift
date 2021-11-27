//
//  StudentModal.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit
protocol StudentModalDelegate : AnyObject {
    func updateStudentModal(placeholder : String)
}

class StudentModal : BaseModal{
    
    weak var delegate : StudentModalDelegate?
    private let bgView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    private let titleLabel = UILabel().then{
        $0.text = "학년/ 반/번호 키번호"
        $0.textColor = .black
        $0.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    }
    private let tf = ModalTF(placeholder: "학년 / 반 / 번호를 입력해주세요 ex: 2108")
    private let btn = UIButton().then{
        $0.backgroundColor = .nuv_MainColor
        $0.layer.cornerRadius = 10
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(studentrLoginBtn), for: .touchUpInside)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    }
    
    //모달 위치 조정
    static func instance() -> StudentModal{
        return StudentModal(nibName: nil, bundle: nil).then{
            $0.modalPresentationStyle = .overFullScreen
        }
    }
    
    @objc private func studentrLoginBtn(){
        dismiss(animated: true) {
            self.delegate?.updateStudentModal(placeholder: self.tf.text ?? "")
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
