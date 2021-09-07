//
//  ViewController.swift
//  RxHomework
//
//  Created by Дмитрий Старков on 04.09.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var isEnableButton = PublishSubject<Bool>()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.rx.text
            .compactMap({ self.isCorrectedEmail(email: $0) ? "" : "Некорректная Почта"
            })
            .bind(to: infoLabel.rx.text)
            .disposed(by: disposeBag)
        
        passwordTF.rx.text
            .compactMap { self.isCorrectedPassword(text: $0) ? " " : "Слишком короткий пароль"
            }
            .bind(to: infoLabel.rx.text)
            .disposed(by: disposeBag)
        
        Observable.combineLatest(emailTF.rx.text, passwordTF.rx.text)
            .compactMap { self.isValid(email: $0 ?? "", password: $1 ?? "")
            }.bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)
       
    }
    
    func isCorrectedEmail(email: String?)-> Bool {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isCorrectedPassword(text: String?)-> Bool {
        guard let text = text else { return false}
        return text.count >= 6
    }
    
    func isValid(email: String,password: String)-> Bool {
        return isCorrectedEmail(email: email) && isCorrectedPassword(text: password)
    }

}

