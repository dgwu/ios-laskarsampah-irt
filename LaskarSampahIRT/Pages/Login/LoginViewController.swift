//
//  LoginViewController.swift
//  LaskarSampahIRT
//
//  Created by okky pribadi on 10/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate
{
    //MARK Outlet
    @IBOutlet weak var txtEmailTlp: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    
    @IBOutlet weak var btnmasuk: UIButton!
    @IBOutlet weak var btnDaftar: UIButton!
    
    //MARK Function
    @IBAction func btnMasuk(_ sender: Any)
    {
        
    }
    
    @IBAction func btnDaftar(_ sender: Any)
    {
        
    }
    
    @IBAction func btnLupaPassword(_ sender: Any)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinasi = segue.destination as? ProfileViewController
        {
            let backItem = UIBarButtonItem()
            backItem.title = "Logout"
            navigationItem.backBarButtonItem = backItem
        } else{
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        btnmasuk.layer.cornerRadius = 10
        btnDaftar.layer.cornerRadius = 10
        
    
    }
}
