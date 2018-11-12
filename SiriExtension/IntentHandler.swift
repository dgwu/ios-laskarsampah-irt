//
//  IntentHandler.swift
//  SiriExtension
//
//  Created by Daniel Gunawan on 04/11/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import Intents

class IntentHandler: INExtension, INGetVisualCodeIntentHandling {
    func handle(intent: INGetVisualCodeIntent, completion: @escaping (INGetVisualCodeIntentResponse) -> Void) {
        
        let intentResponse = INGetVisualCodeIntentResponse(code: .success, userActivity: nil)
        let userTelepon = "082227282872"
        
        if let qrImage = QRCodeHelper().generateQRCodeV2(from: userTelepon), let qrImageData = qrImage.pngData() {
            intentResponse.visualCodeImage = INImage(imageData: qrImageData)
        }
        
        completion(intentResponse)
    }
    
    func confirm(intent: INGetVisualCodeIntent, completion: @escaping (INGetVisualCodeIntentResponse) -> Void) {
        let intentResponse = INGetVisualCodeIntentResponse(code: .success, userActivity: nil)
        
        completion(intentResponse)
    }
    
    func resolveVisualCodeType(for intent: INGetVisualCodeIntent, with completion: @escaping (INVisualCodeTypeResolutionResult) -> Void) {
        completion(INVisualCodeTypeResolutionResult.success(with: .requestPayment))
    }
    
    override func handler(for intent: INIntent) -> Any? {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        return self
    }
    
    
}
