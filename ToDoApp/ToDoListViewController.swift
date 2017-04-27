//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by 황원준 on 2017. 4. 27..
//  Copyright © 2017년 황원준. All rights reserved.
//

import UIKit

class ToDo{
    var state:String? // ToDo or Done
    var jobs:[Job] = []
    
    init(state:String){
        self.state = state
    }
}

class Job{
    var title:String?
    var date:NSDate?
    
    init(title:String, date:NSDate) {
        self.title = title
        self.date = date
    }
    
}

class ToDoListViewController: UITableViewController {
    
    //(Data source) jobList contains Todo and Done Jobs
    var jobList:[ToDo] = [ToDo(state:"ToDo"), ToDo(state:"Done")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    //Returns the number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return jobList.count
    }

    //Returns each Section`s title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return jobList[section].state
    }
    //Setting Section Header Preference
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.darkGray
        headerView.textLabel?.textColor = UIColor.white
        headerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        headerView.textLabel?.textAlignment = .center
        
    }
    
    //Setting Section footer Preference
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView

        footerView.textLabel?.textAlignment = .right
        footerView.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    //Returns the number of tasks in each section
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\(jobList[section].jobs.count) 개"
    }
    
    //Returns the number of rows needed for the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let jobs = jobList[section].jobs
        return jobs.count
    }

    //Returns the set cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyToDoCell", for: indexPath) as! ToDoCell

        let categoryValue = jobList[indexPath.section]

        let job = categoryValue.jobs[indexPath.row]
        
        cell.title.text = job.title // title in cell
        cell.dateTime.text = job.date?.description //date in cell
        
        return cell
    }

    //Delete the job in each section, if state == "ToDo", then the job is moved to "Done" section
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{

            if indexPath.section == 0 {
                let job = jobList[indexPath.section].jobs[indexPath.row]
                
                //add job in done list
                jobList[1].jobs.append(job)
            }
            //remove job in list
            jobList[indexPath.section].jobs.remove(at: indexPath.row)
            
            self.tableView.reloadData()
        }
    }
 
    //unwind function
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue){
    }
    
    // New job is stored in "ToDo"
    func addNewItem(job:Job){
        self.jobList[0].jobs.append(job)
        self.tableView.reloadData()
    }

}
