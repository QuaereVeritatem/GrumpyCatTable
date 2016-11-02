//
//  ViewController.swift
//  GrumpyCatTable
//
//  Created by Robert Martin on 9/2/16.
// tableview/struct demo that simulates things that grumpycat might hate...of course he can change his mind

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    struct GrumpyCatInfo {
        
        var thingToHate: String
        var worthyOfNo: Bool
    }
    
    var grumpyData = [
        GrumpyCatInfo(thingToHate: "Mondays", worthyOfNo: true),
        GrumpyCatInfo(thingToHate: "Weekends", worthyOfNo: false),
        GrumpyCatInfo(thingToHate: "Sunny days", worthyOfNo: true),
        GrumpyCatInfo(thingToHate: "Neighbors", worthyOfNo: true),
        GrumpyCatInfo(thingToHate: "Mail Man", worthyOfNo: true),
        GrumpyCatInfo(thingToHate: "John", worthyOfNo: false),
        GrumpyCatInfo(thingToHate: "Spam Email", worthyOfNo: true),
        GrumpyCatInfo(thingToHate: "Tim", worthyOfNo: false),
        GrumpyCatInfo(thingToHate: "Dogs", worthyOfNo: true),
        GrumpyCatInfo(thingToHate: "Jill", worthyOfNo: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return grumpyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "grumpyCatViewCell", for: indexPath) as! GrumpyCatViewCell
        
        cell.thingToHate.text = grumpyData[(indexPath as NSIndexPath).row].thingToHate
        
        if grumpyData[(indexPath as NSIndexPath).row].worthyOfNo {
            cell.grumpyCat.image = UIImage(named: "grumpy_no")
        } else {
            cell.grumpyCat.image = UIImage(named: "grumpy_meh")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell!.contentView.backgroundColor = UIColor.gray
        
        // Invert or toggle the worthyOfNo value to its opposite.
        grumpyData[(indexPath as NSIndexPath).row].worthyOfNo = !grumpyData[(indexPath as NSIndexPath).row].worthyOfNo
        
        tableView.reloadData()
    }
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.red
    }
    
    // From UITableViewDelegate protocol.
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.clear
    }
}

