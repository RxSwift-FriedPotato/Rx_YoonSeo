//
//  UITextFieldExtension.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import UIKit
extension UITextField {
      func setBottomBorder() {
        self.borderStyle            = .none
        self.layer.backgroundColor  = UIColor.white.cgColor
        self.layer.masksToBounds    = false
        self.layer.shadowColor      = UIColor.KakaoDarkGray.cgColor
        self.layer.shadowOffset     = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity    = 0.8
        self.layer.shadowRadius     = 0.0

      }
    
    func setPlaceHolder(_ text : String, _ color : UIColor, _ font : UIFont) {
        self.attributedPlaceholder = NSAttributedString(string: "\(text)", attributes: [NSAttributedString.Key.foregroundColor : color,NSAttributedString.Key.font : font])
    }
}
