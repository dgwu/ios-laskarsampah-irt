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
    
    func generateQRCodeV2(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        let size = CGSize(width: 300, height: 300)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let qrcodeCIImage = filter.outputImage!
            
            let cgImage = CIContext(options:nil).createCGImage(qrcodeCIImage, from: qrcodeCIImage.extent)
            
            UIGraphicsBeginImageContext(CGSize(width: size.width * UIScreen.main.scale, height: size.height * UIScreen.main.scale))
            let context = UIGraphicsGetCurrentContext()
            context?.interpolationQuality = .none
            context?.draw(cgImage!, in: context!.boundingBoxOfClipPath)
            let preImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let qrCodeImage = UIImage(cgImage: preImage?.cgImage! ?? cgImage!, scale: 1.0/UIScreen.main.scale, orientation: .downMirrored)
            
            return qrCodeImage
        }
        
        return nil
    }
}
