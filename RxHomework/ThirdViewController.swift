//
//  ThirdViewController.swift
//  RxHomework
//
//  Created by Дмитрий Старков on 07.09.2021.
//

import UIKit
import RxSwift

class ThirdViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    let names = Observable.from(["Dima","Denis","Anton"])
    let dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        names.bind(to: tableView.rx.items(cellIdentifier: "cell",cellType: UITableViewCell.self)) {row,data,cell in
//            cell.textLabel?.text = data
           
        }
                    
        
    }
    

}
