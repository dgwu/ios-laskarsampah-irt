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
    let apiHelper = ApiHelper()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinasi = segue.destination as? ProfileViewController
        {
            let backItem = UIBarButtonItem()
            backItem.title = "Logout"
            //backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        } else{
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
//              backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    @IBAction func btnSimpanClick(_ sender: Any)
    {
        guard let nama = txtNama.text,
//            let email = txtEmail.text,  because email is optional
            let telepon = txtTelepon.text,
            let password = txtPassword.text,
            let rePassword = txtRePassword.text
        else {
            return
        }
        
        if password == rePassword {
            // do registration
            self.apiHelper.registerUser(nama: nama, email: txtEmail.text, telepon: telepon, password: password) { (apiToken) in
                if let apiToken = apiToken {
                    // success, keep token to UserDefault
                    UserDefaults.standard.set(apiToken, forKey: "api_token")
                    let api_token = UserDefaults.standard.string(forKey: "api_token") ?? ""
                    DispatchQueue.main.async
                        {
                        print(apiToken)
                        self.performSegue(withIdentifier: "profileShow", sender: nil)
                        }
                } else {
                    // fail, notify user
                    print("gagal")
                }
            }
        } else {
            // notify user password is not match
        }
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        backView.layer.cornerRadius = 10
        
        btnSimpan.layer.cornerRadius = 25
        btnSimpan.backgroundColor = #colorLiteral(red: 0, green: 0.5560629368, blue: 0.4413390756, alpha: 1)
      
        btnSimpan.layer.borderColor =  #colorLiteral(red: 0.8214223385, green: 0.81848979, blue: 0.1368253231, alpha: 1)
        btnSimpan.layer.borderWidth = 5
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    

}
