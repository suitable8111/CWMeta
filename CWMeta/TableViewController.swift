//
//  TableViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 7..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class TableViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {

    var cagoAry = NSArray()
    var currentState : NSString = ""
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    override func viewWillAppear(animated: Bool) {
        if(currentState == "goAll"){
            bgImage.image = UIImage(named: "allbg.png")
        }else if(currentState == "goMarket"){
            bgImage.image = UIImage(named: "marketbg.png")
        }else if(currentState == "goExhibit"){
            bgImage.image = UIImage(named: "exhibitBg.png")
        }else if(currentState == "goEvent"){
            bgImage.image = UIImage(named: "eventBg.png")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.dataSource = self
        tbView.delegate = self
        tbView.rowHeight = 70
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tbView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? UITableViewCell

        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        let titleLabel = cell!.viewWithTag(101) as! UILabel

        titleLabel.text = cagoAry.objectAtIndex(indexPath.row).valueForKey("title") as? String
        
        if(indexPath.row % 2 == 1){
            cell?.backgroundColor = UIColor.whiteColor()
        }else{
            cell?.backgroundColor = UIColor(red: CGFloat(237/255.0), green: CGFloat(236/255.0), blue: CGFloat(236/255.0), alpha: CGFloat(1.0))
        }
        
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cagoAry.count
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "goDetail"){
            var dvControl = segue.destinationViewController as! DetailViewController
            dvControl.dataDic = cagoAry.objectAtIndex(tbView.indexPathForSelectedRow()!.row) as! NSDictionary
        }
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}
