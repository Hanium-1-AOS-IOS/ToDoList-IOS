//
//  ToDoAddingViewController.swift
//  ToDoApp
//
//  Created by 황원준 on 2017. 4. 27..
//  Copyright © 2017년 황원준. All rights reserved.
//

import UIKit

class ToDoAddingViewController: UITableViewController {
    @IBOutlet weak var datePicker: UIDatePicker! //in modal
    @IBOutlet weak var toDoTitle: UITextField! //in modal

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //Make a job and return it
    func makeJob()->Job?{
        
        let jobTitle:String = toDoTitle.text! // value of UITextFiled in modal
        if(jobTitle.isEmpty){
            return nil
        }
        let jobDate:NSDate = datePicker.date as NSDate // value of UIDatePicker in modal
        
        return Job(title:jobTitle,date:jobDate)
        
    }
    
    
    //call ToDoListViewContorller using unwind and new Job adds to "ToDo" section
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddingDone"{
            guard let job = makeJob(), let toDoListVC = segue.destination as? ToDoListViewController else{
                return
            }
            toDoListVC.addNewItem(job: job)
        }
    }
}
