//
//  FourViewController.swift
//  RxHomework
//
//  Created by Дмитрий Старков on 07.09.2021.
//

import UIKit
import RxSwift

class FourViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    var counter =  BehaviorSubject.just(0)
    override func viewDidLoad() {
        super.viewDidLoad()
        counter.map{"Counter:\($0)"}
            .bind(to: label.rx.text)
            .dispose()
        
        
        
      
    }
    

   

}
