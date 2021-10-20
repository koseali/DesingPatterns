//
//  UIViewExtension.swift
//  TodoAppExample
//
//  Created by Ali Kose on 8.10.2021.
//

import Foundation
import UIKit

// Klavye otomatik butonu ilerletme

extension UIView {
    func moveKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(changeKeyboard(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func  changeKeyboard(_ notification : NSNotification){
//        Klavye ne kadar surede konumu degistiricek
         let time = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
//         m degeri ?
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        
//        baslangic bitis bulup koyucaz butonu
        let startPosition = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endPosition = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        Origin Y deger farki alicaz
        let different =  endPosition.origin.y - startPosition.origin.y
        UIView.animateKeyframes(withDuration: time, delay: 0.0, options: KeyframeAnimationOptions.init(rawValue: curve), animations: {self.frame.origin.y += different}, completion: nil)
    }
    
}
/*
 UIResponder.keyboardWillChangeFrameNotification
 user info sozlugu doner
 klavye hakkinda bilgi ve lokasyonunu verir
 */
