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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        if(frameForHeight != 1){
            bgImgae.frame.origin = CGPoint(x: bgImgae.frame.origin.x * frameForWidth, y: bgImgae.frame.origin.y * frameForHeight)
            naviBarImage.frame.origin = CGPoint(x: naviBarImage.frame.origin.x * frameForWidth, y: naviBarImage.frame.origin.y * frameForHeight)
            backBtn.frame.origin = CGPoint(x: backBtn.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            titleLabel.frame.origin = CGPoint(x: titleLabel.frame.origin.x * frameForWidth, y: titleLabel.frame.origin.y * frameForHeight)
            tbView.frame.origin = CGPoint(x: tbView.frame.origin.x * frameForWidth, y: tbView.frame.origin.y * frameForHeight)
            
            bgImgae.frame.size = CGSizeMake(bgImgae.frame.width * frameForWidth,  bgImgae.frame.height * frameForHeight)
            naviBarImage.frame.size = CGSizeMake(naviBarImage.frame.width * frameForWidth,  naviBarImage.frame.height * frameForHeight)
            backBtn.frame.size = CGSizeMake(backBtn.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            titleLabel.frame.size = CGSizeMake(titleLabel.frame.width * frameForWidth,  titleLabel.frame.height * frameForHeight)
            
        }
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
