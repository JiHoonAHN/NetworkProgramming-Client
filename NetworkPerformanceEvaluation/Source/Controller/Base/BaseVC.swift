//
//  BaseVC.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/27.
//

import UIKit

class BaseVc : UIViewController{
    let bounds = UIScreen.main.bounds
    
    @available(*,unavailable)
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure(){ view.backgroundColor = .white}
}

