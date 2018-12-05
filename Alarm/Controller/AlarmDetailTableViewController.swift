//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Jack Knight on 12/3/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    var alarmIsOn: Bool = true
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmName: UITextField!
    @IBOutlet weak var alarmButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
   
// Landing Pad
    var alarm: Alarm? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    
    
    private func updateViews() {
        datePicker.date = alarm?.fireDate ?? Date()
        alarmName.text = alarm?.name
        alarmButton.titleLabel?.isEnabled = alarm?.enabled ?? false
    }
    
    
    // MARK: - Table view data source

    
    @IBAction func saveButtonTapped(_ sender: Any) {
      guard alarmName.text != "",
        let alarmName = alarmName.text,
        let alarmDate = datePicker?.date else { return }
        if let alarmSave = alarm {
            AlarmController.shared.update(alarm: alarmSave, fireDate: alarmDate, name: alarmName, enabled: true)
        } else {
            AlarmController.shared.addAlarm(fireDate: alarmDate, name: alarmName, enabled: true)
            }
        navigationController?.popViewController(animated: true)
      }
    
    @IBAction func enableButtonTapped(_ sender: Any) {
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
