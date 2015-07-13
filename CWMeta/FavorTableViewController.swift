//
//  FavorTableViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 7..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class FavorTableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    var favorArray: NSMutableArray!
    @IBOutlet weak var tbView: UITableView!
    @IBOutlet weak var bgImgae: UIImageView!
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        let path = getFileName("myFavorite.plist")
        let fileManager = NSFileManager.defaultManager()
        if(!fileManager.fileExistsAtPath(path)){
            let orgPath = NSBundle.mainBundle().pathForResource("myFavorite", ofType: "plist")
            fileManager.copyItemAtPath(orgPath!, toPath: path, error: nil)
        }
        favorArray = NSMutableArray(contentsOfFile: path)
        tbView.delegate = self
        tbView.dataSource = self
        tbView.reloadData()
        tbView.rowHeight = 70;
        
    }
    func getFileName(fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docPath = docsDir[0] as! String
        let fullName = docPath.stringByAppendingPathComponent(fileName)
        return fullName
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tbView.dequeueReusableCellWithIdentifier("FavorCell", forIndexPath: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        let titleLabel = cell!.viewWithTag(201) as! UILabel
        
        titleLabel.text = favorArray.objectAtIndex(indexPath.row).valueForKey("title") as? String
        
        if(indexPath.row % 2 == 1){
            cell?.backgroundColor = UIColor.whiteColor()
        }else{
            cell?.backgroundColor = UIColor(red: CGFloat(237/255.0), green: CGFloat(236/255.0), blue: CGFloat(236/255.0), alpha: CGFloat(1.0))
        }
        
        return cell!
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorArray.count
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            favorArray.removeObjectAtIndex(indexPath.row)
            let path = getFileName("myFavorite.plist")
            favorArray.writeToFile(path, atomically: true)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "goFavorDetail"){
            var fdvControl = segue.destinationViewController as! FavorDetailViewController
            fdvControl.dataDic = favorArray.objectAtIndex(tbView.indexPathForSelectedRow()!.row) as! NSDictionary
            fdvControl.favorArray = favorArray
            fdvControl.indexPathRow = tbView.indexPathForSelectedRow()!.row
        }
    }
    
    @IBAction func actPervios(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}
