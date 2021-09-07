//
//  TwoViewController.swift
//  RxHomework
//
//  Created by Дмитрий Старков on 06.09.2021.
//

import UIKit
import RxSwift
import RxCocoa

class TwoViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    let disposeBag = DisposeBag()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.rx.text
            .throttle(.seconds(2), scheduler: MainScheduler.instance)
            .bind { print("отправка запроса для \($0 ?? "")")
            }.disposed(by: disposeBag)
            

        
    }
    

}
