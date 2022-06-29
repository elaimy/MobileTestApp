//
//  ViewController.swift
//  MobileTestApp
//
//  Created by Ahmed El-elaimy on 29/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var task1 : UIButton!
    @IBOutlet weak var task2 : UIButton!
    @IBOutlet weak var task3 : UIButton!
    @IBOutlet weak var task4 : UIButton!
    
    @IBOutlet weak var view1 : UIView!
    @IBOutlet weak var view2 : UIView!
    
    var date : [String] = []
    var storedTasks : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let views : [UIView] = [view1, view2]
        
        roundedView(views: views)
        
    }
    
    @IBAction func taskBtn(_ sender : UIButton){
        let tasks : [UIButton] = [task1, task2, task3, task4]
        for item in 0..<tasks.count{
            if sender == tasks[item]{
                
                let currentDate = String(DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short))
                
                storedTasks.append(sender.currentTitle!)
                date.append("\(currentDate)")
                
                tasks[item].setTitleColor(.white, for: .normal)
                tasks[item].backgroundColor = UIColor.black
                roundedButton(button: tasks[item])
                tableView.reloadData()
                
                
                let indexPath = IndexPath(row: date.count - 1, section: 0)
                    tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            } else {
                tasks[item].setTitleColor(.black, for: .normal)
                tasks[item].backgroundColor = UIColor.white
                clearRoundedButton(button: tasks[item])
            }
        }
    }
    func roundedView(views : [UIView]) {
        for item in 0..<views.count {
            views[item].layer.cornerRadius = 8
            views[item].layer.borderWidth = 1
            views[item].layer.borderColor = UIColor(named: "bgColor")?.cgColor
        }
    }
    
    func roundedButton(button : UIButton) {
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
    }
    
    func clearRoundedButton(button : UIButton) {
        button.layer.borderWidth = 0
        button.layer.cornerRadius = 0

    }
    
    
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storedTasks.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksCell", for: indexPath) as! TasksCell
        cell.dateLabel.text = date[indexPath.row]
        cell.tasksLabel.text = storedTasks[indexPath.row]
        
        
        return cell
    }






}

