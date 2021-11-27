//
//  ViewController.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/27.
//

import UIKit

class MainStudentViewController: UITabBarController {
    private let homeVc = LectureViewController()
    private let homeworkSubmissionVc = SubmissionViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabbarSetting()
        tabbarCustom()
    }
    
    private func tabbarSetting(){
        homeVc.tabBarItem.image = UIImage(systemName: "house")?.withRenderingMode(.alwaysTemplate)
        homeworkSubmissionVc.tabBarItem.image = UIImage(systemName: "doc")?.withRenderingMode(.alwaysTemplate)
        viewControllers = [homeVc,homeworkSubmissionVc]
    }
    private func tabbarCustom(){
        tabBar.barStyle = .default
        tabBar.layer.applySketchShadow(color: .nuv_MainColor, alpha: 0.25, x: 1, y: 0, blur: 10, spread: 0)
        tabBar.tintColor = .nuv_MainColor
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.shadowImage = nil
    }
}

