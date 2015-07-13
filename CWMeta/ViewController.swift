//
//  ViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 6. 29..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var dataModel : DataModel!
    var cagoDataArray : NSMutableArray!
    var transforming = true
    var rotating = true
    
    @IBOutlet weak var aniImageView4: UIView!
    @IBOutlet weak var aniImageView3: UIView!
    @IBOutlet weak var aniImageView2: UIView!
    @IBOutlet weak var aniImageView: UIView!
    
    @IBOutlet weak var exhibitBtn: UIButton!
    @IBOutlet weak var eventBtn: UIButton!
    @IBOutlet weak var marketBtn: UIButton!
    @IBOutlet weak var favorBtn: UIButton!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    
    func modelData() -> DataModel{
        if(dataModel == nil){
            dataModel = DataModel()
        }
        return dataModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        rotateOnce()
        
        UIView.animateWithDuration(1.3, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
            self.favorBtn.transform = CGAffineTransformMakeTranslation(0,-120)
            self.marketBtn.transform = CGAffineTransformMakeTranslation(110,-55)
            self.eventBtn.transform = CGAffineTransformMakeTranslation(110,+55)
            self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,120)
            self.allBtn.transform = CGAffineTransformMakeTranslation(-110,55)
            self.infoBtn.transform = CGAffineTransformMakeTranslation(-110,-55)
        }, completion: nil)
        
        self.modelData()
        dataModel.beginParsing()
        cagoDataArray = NSMutableArray()
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        cagoDataArray = []
        if(segue.identifier == "goMarket"){
            var tvControl = segue.destinationViewController as! TableViewController
        
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("마켓&행사")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goEvent"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("공연")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goExhibit"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("전시")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goEtc"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("기타")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goAll"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            tvControl.cagoAry = dataModel.posts as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goFavor"){

        }else if(segue.identifier == "goInfo"){
            
        }
    }
    @IBAction func actMenuBtn(sender: AnyObject) {
        if(transforming  == false){
            UIView.animateWithDuration(1.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
                self.favorBtn.transform = CGAffineTransformMakeTranslation(0,-120)
                self.marketBtn.transform = CGAffineTransformMakeTranslation(110,-55)
                self.eventBtn.transform = CGAffineTransformMakeTranslation(110,+55)
                self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,120)
                self.allBtn.transform = CGAffineTransformMakeTranslation(-110,55)
                self.infoBtn.transform = CGAffineTransformMakeTranslation(-110,-55)
            }, completion: nil)
            transforming = true
        }else{
            UIView.animateWithDuration(1.3, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
                self.favorBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.marketBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.eventBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.allBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.infoBtn.transform = CGAffineTransformMakeTranslation(0,0)
                }, completion: nil)
            transforming = false
        }
    }
    func rotateOnce() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveLinear, animations: {
                self.aniImageView.transform = CGAffineTransformRotate(self.aniImageView.transform, 3.1415926*0.25)
                self.aniImageView2.transform = CGAffineTransformRotate(self.aniImageView2.transform, 3.1415926*0.25)
                self.aniImageView3.transform = CGAffineTransformRotate(self.aniImageView3.transform, 3.1415926*0.25)
                self.aniImageView4.transform = CGAffineTransformRotate(self.aniImageView4.transform, 3.1415926*0.25)
            }, completion: {finished in self.rotateAgain()})
    }
    
    func rotateAgain() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveLinear, animations: {
            self.aniImageView.transform = CGAffineTransformRotate(self.aniImageView.transform, -3.1415926*0.25)
            self.aniImageView2.transform = CGAffineTransformRotate(self.aniImageView2.transform, -3.1415926*0.25)
            self.aniImageView3.transform = CGAffineTransformRotate(self.aniImageView3.transform, -3.1415926*0.25)
            self.aniImageView4.transform = CGAffineTransformRotate(self.aniImageView4.transform, -3.1415926*0.25)
            },completion: {finished in if self.rotating { self.rotateOnce() }})
    }

    
}

