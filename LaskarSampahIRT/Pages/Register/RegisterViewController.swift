//
//  RegisterViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 15/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtNama: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTelepon: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRePassword: UITextField!
    @IBOutlet weak var btnSimpan: UIButton!
    
    @IBOutlet weak var backView: UIView!
    
    
    @IBAction func btnSimpanClick(_ sender: Any)
    {
        
        
        
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        backView.layer.cornerRadius = 10
        
        btnSimpan.layer.cornerRadius = 10
        btnSimpan.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.4666666667, blue: 0.368627451, alpha: 1)
        
    }
    
    

}
