//
//  QRCodeHelper.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 11/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Foundation
import UIKit

class QRCodeHelper {
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
