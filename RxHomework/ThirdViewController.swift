//
//  ThirdViewController.swift
//  RxHomework
//
//  Created by Дмитрий Старков on 07.09.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ThirdViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    
    var names = ["Dima","Denis","Anton"]
    var namesrx = BehaviorRelay(value: [String]())
    
    let randomArray = ["Anna","Nikita","Oleg","John","Tom","Sveta","Maria"]
    let dispose = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesrx.accept(names)
            namesrx.bind(to: tableView.rx.items) {
            (tableView, row, element) in
                             let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
                             cell.textLabel?.text = "\(element)"
                             return cell
        }.disposed(by: dispose)
       
                        
            
    }
    
    @IBAction func addButton(_ sender: Any) {
        let new  = randomArray.randomElement() ?? ""
        names.append(new)
        namesrx.accept(names)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        names.removeLast()
        namesrx.accept(names)
    }
    
    
}
