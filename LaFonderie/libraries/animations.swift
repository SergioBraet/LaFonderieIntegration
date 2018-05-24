//
//  animations.swift
//  LaFonderie
//
//  Created by BRAET Sergio (s) on 23/05/2018.
//  Copyright © 2018 BRAET Sergio (s). All rights reserved.
//

import Foundation
import UIKit

class animations {
    func moveUpDown(distance: Float, speed: Float, image: UIImageView){

            
            image.transform = CGAffineTransform(translationX: 0, y: CGFloat(distance))
 
        
    }
}
