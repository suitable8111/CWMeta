//
//  DataModel.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 6. 30..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import Foundation

class DataModel : NSObject, NSXMLParserDelegate {
    var parser = NSXMLParser()
    var posts = NSMutableArray()
    var element = NSString()
    var elements = NSMutableDictionary()
    var title = NSMutableString()
    var content = NSMutableString()
    var thumbnail = NSMutableString()
    var count : Int = 0
    
    
    var option_key = NSMutableString()
    var option_value = NSMutableString()
    
    func beginParsing(){
        
        var stringURL : String = ""
        stringURL = "http://52.68.142.137/xml/wordpress-db..xml"
        
        var url = NSURL(string: stringURL)
        
//        let url = NSBundle.mainBundle().URLForResource("wordpress-db.", withExtension: "xml")
        
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.parse()
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        element = elementName
        if(elementName as NSString).isEqualToString("row"){
            
            if(count % 10 == 0) {
                elements = NSMutableDictionary.alloc()
                elements = [:]
            }
            
            title = NSMutableString.alloc()
            title = ""
            content = NSMutableString.alloc()
            content = ""
            option_key = NSMutableString.alloc()
            option_key = ""
            option_value = NSMutableString.alloc()
            option_value = ""
            thumbnail = NSMutableString.alloc()
            thumbnail = ""

            
        }
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName as NSString).isEqualToString("row") {
            
            count = count + 1
            
            if (!title.isEqual(nil) && count%10 == 1 )  {
                elements.setObject(title, forKey: "title")
            }
            if (!content.isEqual(nil) && count%10 == 1) {
                elements.setObject(content, forKey: "content")
            }
            if (!content.isEqual(nil) && count%10 == 1) {
                elements.setObject(thumbnail, forKey: "thumbnail_file")
            }
            if option_key.isEqualToString("name\n\t\t\t\t" ){
                elements.setObject(option_value, forKey: "name")
            }
            if option_key.isEqualToString("category\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "category")
            }
            if option_key.isEqualToString("price\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "price")
            }
            if option_key.isEqualToString("period\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "period")
            }
            if option_key.isEqualToString("tel\n\t\t\t\t") {
                elements.setObject(option_value, forKey: "tel")
            }
            if option_key.isEqualToString("email\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "email")
            }
            if option_key.isEqualToString("place\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "place")
            }
            if option_key.isEqualToString("startTime\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "startTime")
            }
            if option_key.isEqualToString("endTime\n\t\t\t\t"){
                elements.setObject(option_value, forKey: "endTime")
            }
            
            if(count % 10 == 9){
                posts.addObject(elements)
                count = count + 1
            }
        }
    }
        func parser(parser: NSXMLParser, foundCharacters string: String?) {
            
            if element.isEqualToString("title"){
                title.appendString(replaceSpecialChar(string!))
            }else if element.isEqualToString("content"){
                content.appendString(replaceSpecialChar(string!))
            }else if element.isEqualToString("thumbnail_file"){
                thumbnail.appendString(replaceSpecialChar(string!))
            }else if element.isEqualToString("option_key"){
                option_key.appendString(string!)
            }else if element.isEqualToString("option_value"){
                option_value.appendString(replaceSpecialChar(string!))
                
            }
        }
    func replaceSpecialChar(str:String) -> String{
        var str_change = NSMutableString(string: str)
        
        str_change.replaceOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, str_change.length))
        str_change.replaceOccurrencesOfString("\t", withString: "", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, str_change.length))
        return str_change as String
    }
    
    
}
