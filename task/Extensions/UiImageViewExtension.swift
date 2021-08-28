//
//  UiImageViewExtension.swift
//  task
//
//  Created by Boo Doo on 8/26/21.
//

import Foundation
import Kingfisher
extension UIImageView {
    func loadImageFrom(imgUrl: String) {
         if let url = URL(string: imgUrl){
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url)
         }else{
             print("image url: nil \(imgUrl)")
         }
        }
        
       }
