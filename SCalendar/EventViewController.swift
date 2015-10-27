//
//  EventViewController.swift
//  SCalendar
//
//  Created by Alex Huang on 10/26/15.
//  Copyright © 2015 Alex Huang. All rights reserved.
//

import UIKit

class EventViewController: UIViewController,UITextFieldDelegate {
    
    // variable field
    var name2 : [String] = []
    var time2 : [String] = []
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    var format = NSDateFormatter()
    var timeString = ""
    @IBOutlet weak var eventName: UITextField!
    
    
    @IBAction func valChanged(sender: AnyObject) {
        timeChange()
    }
    
    func timeChange(){
        format.timeStyle = NSDateFormatterStyle.ShortStyle
        timeString = format.stringFromDate(datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "addS" {
            let viewController: PlannerViewController = segue.destinationViewController as! PlannerViewController
            format.timeStyle = NSDateFormatterStyle.ShortStyle
            timeString = format.stringFromDate(datePicker.date)
            
            name2.append(eventName.text!)
            time2.append(timeString)
            viewController.name = name2
            viewController.time = time2
            
        }
        else  if segue.identifier == "backS" {

            let viewController: PlannerViewController = segue.destinationViewController as! PlannerViewController
            viewController.name = name2
            viewController.time = time2
        }
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
