//
//  ContainerViewController.swift
//  ToDoApp
//
//  Created by Nodirjon on 3/9/19.
//  Copyright © 2019 Nodirjon. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var connectionButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var todoTableViewContoller: ToDoTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = addButton.frame.size.width / 2

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TodoVC" {
            todoTableViewContoller = (segue.destination as! UINavigationController).children.first as? ToDoTableViewController
            todoTableViewContoller.connectionButtonReference = connectionButton
        }
    }

    @IBAction func addNewTodoItem(_ sender: Any) {
        todoTableViewContoller.addNewToDo()
    }
    @IBAction func triggerConnection(_ sender: Any) {
        todoTableViewContoller.showConnectivityAction()
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
