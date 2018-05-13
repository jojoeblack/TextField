//
//  ViewController.swift
//  demoUI_TextField
//
//  Created by MacPro on 2018/4/2.
//  Copyright © 2018年 JoeMac01. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnActionSheet: UIButton!
    @IBOutlet weak var btnAlertView: UIButton!
    @IBAction func btnSend_Click(_ sender: Any) {
        if self.myTextField.text != "" {
            self.lblMsg.text = self.myTextField.text
        }
    }
    @IBAction func btnActionSheet_Click(_ sender: Any) {
     let myAlertController = UIAlertController(title: "送出確認", message: "您確認送出資料?", preferredStyle: UIAlertControllerStyle.actionSheet)
     let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.destructive, handler: {
        //closure
        (ACTION) -> Void in
        self.lblMsg.text = self.myTextField.text
        
     })
     
       let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.default, handler: {
        (ACTION) -> Void in
       })
       let moreAction = UIAlertAction(title: "更多選項", style: .default, handler: {
        (ACTION) -> Void in
       })
        let moreAction2 = UIAlertAction(title: "更多選項二", style: .default, handler: {
            (ACTION) -> Void in
        })
    myAlertController.addAction(okAction)
    myAlertController.addAction(cancelAction)
    myAlertController.addAction(moreAction)
    myAlertController.addAction(moreAction2)
    
        self.present(myAlertController, animated: true, completion: nil)
    }// end actionsheet
    
    
    @IBAction func btnAlertView_Click(_ sender: Any) {
        let myAlterController = UIAlertController(title: "確認送出", message: "您確定要送出?", preferredStyle: UIAlertControllerStyle.alert)
        myAlterController.addTextField(configurationHandler: {
            (textField: UITextField) -> Void in
            textField.placeholder = "輸入帳號"
        })
        myAlterController.addTextField(configurationHandler: {
            (textField: UITextField) -> Void in
            textField.placeholder = "輸入密碼"
            textField.isSecureTextEntry = true
            })
        let okAction = UIAlertAction(title: "確認", style: UIAlertActionStyle.destructive, handler: {
            (ACTION) -> Void in
            let username = myAlterController.textFields![0].text
            let password = myAlterController.textFields![1].text
            self.lblMsg.text = "輸入:\(self.myTextField.text!) \n 帳號:\(username!) \n 密碼:\(password!)"
            
        })
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: {
            (ACTION) -> Void in
        })
        
        myAlterController.addAction(cancelAction)
        myAlterController.addAction(okAction)
        self.present(myAlterController, animated: true, completion: nil)
    }
    @IBAction func myTextField_EndEdit(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myTextField.resignFirstResponder()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //開始輸入的狀態
        var shift: CGFloat = 0.0 //位移值
        if textField.tag == 1 {
            shift = 60.0
        }else if textField.tag == 2 {
            
        }
        self.view.center = CGPoint(x: self.view.center.x, y: self.view.center.y - shift)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        var shift: CGFloat = 0.0 //位移值
        if textField.tag == 1 {
            shift = 60.0
        }else if textField.tag == 2 {
            
        }
        self.view.center = CGPoint(x: self.view.center.x, y: self.view.center.y + shift)
    }

}

