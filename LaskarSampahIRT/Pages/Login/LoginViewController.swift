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
    
    var loginUserApinya = [loginUser]()
    let apiHelper = ApiHelper()
    
    
    
    //MARK Function
    @IBAction func btnMasuk(_ sender: Any)
    {
       
        if txtEmailTlp.text == ""
        {
            onLoginFail(title: "Pesan", message: "Masukkan email / Telepon yang sudah terdaftar")
        }else if txtPassword.text == ""
        {
            onLoginFail(title: "Pesan", message: "Masukkan sandi yang sudah terdaftar")
        }
        else
        {
            
//            checkLogin(telepon: txtEmailTlp.text!, password: txtPassword.text!) { (status) in
//                if let statusnya = status
//                {
//                    if statusnya == true
//                    {
////
//
//                       self.performSegue(withIdentifier: "profileShow", sender: nil)
//
//                    }else
//                    {
//                        print("salah")
//                    }
//
//                }
//            }
            checkLogin(telepon: txtEmailTlp.text!, password: txtPassword.text!)
        }
    }
    
    
    
    
    func checkLogin(telepon : String , password: String)
    {
        let apiPath = "login"
        let parameters = [
            "phone" : telepon,
            "password": password
        ]
        self.apiHelper.postAndCheckIsValid(apiPath: apiPath, parameters: parameters) { (responseDictionary) in
            if let responseDictionary = responseDictionary
            {
                
                do {
                    if let result = responseDictionary["result"] as? [String : Any] {
                    print("resultnya:\(result)")
                        DispatchQueue.main.async {
                            UserDefaults.standard.set(result["api_token"]!, forKey: "api_token")
                            let api_token = UserDefaults.standard.string(forKey: "api_token") ?? ""
                            print(api_token)
                            GetUser.init(apitoken: api_token)
                            
                            self.performSegue(withIdentifier: "profileShow", sender: nil)
                        }
                    } else {
                        print("gagal translate result")
                    }
                    
                   // completion(status)
                } catch
                    {
                        print("Error on fetchPriceList: \(error.localizedDescription)")
                    }
            }
        }
    }
    
    
    
    func onLoginFail(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnDaftar(_ sender: Any)
    {
        self.performSegue(withIdentifier: "registerShow", sender: nil)
    }
    
    @IBAction func btnLupaPassword(_ sender: Any)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinasi = segue.destination as? ProfileViewController
        {
            let backItem = UIBarButtonItem()
            backItem.title = "Logout"
         //    backItem.title = ""
            navigationItem.backBarButtonItem = backItem
        } else{
            let backItem = UIBarButtonItem()
            //backItem.title = "Back"
            backItem.title = ""
//            navigationItem.backBarButtonItem = backItem
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
        btnmasuk.layer.cornerRadius = 25
        btnmasuk.backgroundColor = #colorLiteral(red: 0.8214223385, green: 0.81848979, blue: 0.1368253231, alpha: 1)
        
        btnDaftar.layer.cornerRadius = 25
        btnDaftar.backgroundColor = #colorLiteral(red: 0, green: 0.5560629368, blue: 0.4413390756, alpha: 1)
        btnDaftar.layer.borderColor =  #colorLiteral(red: 0.8214223385, green: 0.81848979, blue: 0.1368253231, alpha: 1)
        btnDaftar.layer.borderWidth = 5
        

    }
}
