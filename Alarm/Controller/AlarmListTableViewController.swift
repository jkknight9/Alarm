//
//  AlarmListTableViewController.swift
//  Alarm
//
//  Created by Jack Knight on 12/3/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.shared.alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell else {fatalError()}
        let alarms = AlarmController.shared.alarms[indexPath.row]
        cell.alarm = alarms
        cell.delegate = self
        
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteAnAlarm = AlarmController.shared.alarms[indexPath.row]
            AlarmController.shared.delete(alarm: deleteAnAlarm)
            tableView.deleteRows(at: [indexPath], with: .fade)
    
        }
    }
    

// MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let index = tableView.indexPathForSelectedRow else { return}
             let destinationVC = segue.destination as? AlarmDetailTableViewController
            let alarm = AlarmController.shared.alarms[index.row]
            destinationVC?.alarm = alarm
    }
    }

}

extension AlarmListTableViewController: SwitchTableViewCellDelegate {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return}
        let alarm = AlarmController.shared.alarms[indexPath.row]
        AlarmController.shared.toggleEnabled(for: alarm)
    }
    
    
}
