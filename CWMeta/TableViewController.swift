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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        if(currentState == "goAll"){
            bgImage.image = UIImage(named: "allbg.png")
            titleLabel.text = "모두보기"
        }else if(currentState == "goMarket"){
            bgImage.image = UIImage(named: "marketbg.png")
            titleLabel.text = "마켓&행사"
        }else if(currentState == "goExhibit"){
            bgImage.image = UIImage(named: "exhibitBg.png")
            titleLabel.text = "전시"
        }else if(currentState == "goEvent"){
            bgImage.image = UIImage(named: "eventBg.png")
            titleLabel.text = "공연"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tbView.dataSource = self
        tbView.delegate = self
        tbView.rowHeight = 70
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        if(frameForHeight != 1){
            bgImage.frame.origin = CGPoint(x: bgImage.frame.origin.x * frameForWidth, y: bgImage.frame.origin.y * frameForHeight)
            naviBarImage.frame.origin = CGPoint(x: naviBarImage.frame.origin.x * frameForWidth, y: naviBarImage.frame.origin.y * frameForHeight)
            backBtn.frame.origin = CGPoint(x: backBtn.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            titleLabel.frame.origin = CGPoint(x: titleLabel.frame.origin.x * frameForWidth, y: titleLabel.frame.origin.y * frameForHeight)
            tbView.frame.origin = CGPoint(x: tbView.frame.origin.x * frameForWidth, y: tbView.frame.origin.y * frameForHeight)
            
            bgImage.frame.size = CGSizeMake(bgImage.frame.width * frameForWidth,  bgImage.frame.height * frameForHeight)
            naviBarImage.frame.size = CGSizeMake(naviBarImage.frame.width * frameForWidth,  naviBarImage.frame.height * frameForHeight)
            backBtn.frame.size = CGSizeMake(backBtn.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            titleLabel.frame.size = CGSizeMake(titleLabel.frame.width * frameForWidth,  titleLabel.frame.height * frameForHeight)
            
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tbView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? UITableViewCell

        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        let titleLabel = cell!.viewWithTag(101) as! UILabel

        titleLabel.text = cagoAry.objectAtIndex(cagoAry.count-indexPath.row-1).valueForKey("title") as? String
        
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
            dvControl.dataDic = cagoAry.objectAtIndex(cagoAry.count-tbView.indexPathForSelectedRow()!.row-1) as! NSDictionary
        }
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

}
