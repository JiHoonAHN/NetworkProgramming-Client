//
//  ModalTF.swift
//  NetworkPerformanceEvaluation
//
//  Created by Ji-hoon Ahn on 2021/11/28.
//

import UIKit

class ModalTF : UITextField{
    
    init(placeholder: String){
        super.init(frame: .zero)
        backgroundColor = .white
        layer.applySketchShadow(color: .black, alpha: 0.25, x: 0, y: 4, blur: 10, spread: 0)
        attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
