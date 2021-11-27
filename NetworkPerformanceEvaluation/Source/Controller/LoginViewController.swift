//
//  LoginViewController.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/27.
//

import UIKit
import Then
import SnapKit
class LoginViewController : BaseVc{
    //MARK: - 모달 background 설정
   private  let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0
    }
    private let logobgView = UIView().then{
        $0.backgroundColor = .nuv_MainColor
    }
    private let logo = UIImageView().then{
        $0.image = UIImage(named: "Network_MainLogo")
        $0.contentMode = .scaleAspectFill
    }
    private let studentBtn = UIButton().then{
        $0.backgroundColor = .nuv_MainColor
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("학생로그인", for: .normal)
        $0.layer.applySketchShadow(color: .lightGray, alpha: 0.25, x: 0, y: 4, blur: 4, spread: 0)
        $0.layer.cornerRadius = 20
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        $0.addTarget(self, action: #selector(studentLogin), for: .touchUpInside)
    }
    private let teacherBtn = UIButton().then{
        $0.backgroundColor = .nuv_MainColor
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("교사로그인", for: .normal)
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(teacherLogin), for: .touchUpInside)
        $0.layer.applySketchShadow(color: .lightGray, alpha: 0.25, x: 0, y: 4, blur: 4, spread: 0)
        $0.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
    }
    //MARK: - Selector
    @objc private func studentLogin(){
        NSLog("Touch Student Login")
        
    }
    @objc private func teacherLogin(){
        NSLog("Touch Teacher Login")

    }
    
    //MARK: - Helper
    override func configure() {
        super.configure()
        addView()
        location()
    }
    
    private func addView(){
        [logobgView,logo,studentBtn,teacherBtn].forEach{view.addSubview($0)}
    }
    private func location(){
        logobgView.snp.makeConstraints{
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(bounds.height/3.274)
        }
        logo.snp.makeConstraints{
            $0.centerY.equalTo(bgView)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(92)
        }
        studentBtn.snp.makeConstraints{
            $0.top.equalTo(bgView.snp.bottom).offset(bounds.height/3.5)
            $0.left.right.equalToSuperview().inset(34)
            $0.height.equalTo(bounds.height/15)
        }
        teacherBtn.snp.makeConstraints{
            $0.top.equalTo(studentBtn.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(34)
            $0.height.equalTo(bounds.height/15)
        }
    }
}
extension LoginViewController {
    //MARK: - 모달 실행시 Action
    private func addDim() {
        view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
        DispatchQueue.main.async { [weak self] in
            self?.bgView.alpha = 0.1
            self?.navigationController?.navigationBar.backgroundColor = self?.bgView.backgroundColor?.withAlphaComponent(0.1)
        }
    }
    //모달 취소시 Action
    private func removeDim() {
        DispatchQueue.main.async { [weak self] in
            self?.bgView.removeFromSuperview()
            self?.navigationController?.navigationBar.backgroundColor = .clear
        }
    }
}
