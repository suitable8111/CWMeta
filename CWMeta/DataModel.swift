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
    var name = NSMutableString()
    var tel = NSMutableString()
    var email = NSMutableString()
    var place = NSMutableString()
    var category = NSMutableString()
    var price = NSMutableString()
    var period = NSMutableString()
    var startTime = NSMutableString()
    var endTime = NSMutableString()
    var latitude = NSMutableString()
    var longtitude = NSMutableString()
    
    func beginParsing(){
        
        var stringURL : String = ""
        stringURL = "http://52.68.142.137/xml/wordpressXml.php"
        
        let url = NSURL(string: stringURL)
        
        parser = NSXMLParser(contentsOfURL: url!)!
        parser.delegate = self
        parser.parse()
    }
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        element = elementName
        if(elementName as NSString).isEqualToString("row"){
            elements = NSMutableDictionary()
            elements = [:]
            title = NSMutableString()
            title = ""
            content = NSMutableString()
            content = ""
            thumbnail = NSMutableString()
            thumbnail = ""
            name = NSMutableString()
            name = ""
            tel = NSMutableString()
            tel = ""
            email = NSMutableString()
            email = ""
            place = NSMutableString()
            place = ""
            category = NSMutableString()
            category = ""
            price = NSMutableString()
            price = ""
            period = NSMutableString()
            period = ""
            startTime = NSMutableString()
            startTime = ""
            endTime = NSMutableString()
            endTime = ""
            latitude = NSMutableString()
            latitude = ""
            longtitude = NSMutableString()
            longtitude = ""
        }
    }
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqualToString("row") {
            if !title.isEqual(nil) {
                elements.setObject(title, forKey: "title")
            }
            if !content.isEqual(nil) {
                elements.setObject(content, forKey: "content")
            }
            if !thumbnail.isEqual(nil) {
                elements.setObject(thumbnail, forKey: "thumbnail_file")
            }
            if !tel.isEqual(nil) {
                elements.setObject(tel, forKey: "tel")
            }
            if !email.isEqual(nil) {
                elements.setObject(email, forKey: "email")
            }
            if !place.isEqual(nil) {
                elements.setObject(place, forKey: "place")
            }
            if !category.isEqual(nil) {
                elements.setObject(category, forKey: "category")
            }
            if !price.isEqual(nil) {
                elements.setObject(price, forKey: "price")
            }
            if !period.isEqual(nil) {
                elements.setObject(period, forKey: "period")
            }
            if !startTime.isEqual(nil) {
                elements.setObject(startTime, forKey: "startTime")
            }
            if !endTime.isEqual(nil) {
                elements.setObject(endTime, forKey: "endTime")
            }
            if !latitude.isEqual(nil) {
                elements.setObject(latitude, forKey: "latitude")
            }
            if !longtitude.isEqual(nil) {
                elements.setObject(longtitude, forKey: "longtitude")
            }

            posts.addObject(elements)
        
       
        }
        
    }
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if element.isEqualToString("title"){
            title.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("content"){
            content.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("thumbnail_file"){
            thumbnail.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("name"){
            name.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("tel"){
            tel.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("email"){
            email.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("place"){
            place.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("category"){
            category.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("price"){
            price.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("period"){
            period.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("startTime"){
            startTime.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("endTime"){
            endTime.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("longtitude"){
            longtitude.appendString(replaceSpecialChar(string))
        }else if element.isEqualToString("latitude"){
            latitude.appendString(replaceSpecialChar(string))
        }
    }
    func replaceSpecialChar(str:String) -> String{
        let str_change = NSMutableString(string: str)
        
        str_change.replaceOccurrencesOfString("\n", withString: "", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, str_change.length))
        str_change.replaceOccurrencesOfString("\t", withString: "", options: NSStringCompareOptions.LiteralSearch, range: NSMakeRange(0, str_change.length))
        return str_change as String
    }
    
    
}
