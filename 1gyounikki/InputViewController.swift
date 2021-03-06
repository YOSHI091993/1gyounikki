//
//  InputViewController.swift
//  1gyounikki
//
//  Created by 吉和　匠 on 2020/07/24.
//  Copyright © 2020 SHO Yoshiwa. All rights reserved.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let realm = try! Realm()
    var task: Task!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        textField.text = task.title
//        contentsTextView.text = task.contents
        datePicker.date = task.date
    }
    
   

    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.task.title = self.textField.text!
//            self.task.contents = self.contentsTextView.text
            self.task.date = self.datePicker.date
            self.realm.add(self.task, update: .modified)
        }
        super.viewWillDisappear(animated)
    }
    
    @objc func dismissKeyboard(){
           // キーボードを閉じる
           view.endEditing(true)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
