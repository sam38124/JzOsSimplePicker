//
//  SimplePicker.swift
//  JzSimplePicker
//
//  Created by Jianzhi.wang on 2020/1/29.
//  Copyright © 2020 Jianzhi.wang. All rights reserved.
//

import Foundation
import UIKit
public class SimplePicker:NSObject,UIPickerViewDelegate,UIPickerViewDataSource{
    var item:[String]! = nil
    var callback: ((_ position:String) -> Void)!=nil
    var picker=UIPickerView()
    public init(_ view:UIView,_ item:[String],_ selectLinstener:@escaping (_ position:String) -> Void) {
        callback=selectLinstener
        self.item=item
        picker.backgroundColor = .white
        let color1 = UIColor.black
        //        let color2 = UIColor.white
        picker.setValue(color1, forKey: "textColor")
        picker.frame=CGRect(x: 0,y: view.frame.maxY-200,width: view.frame.width,height: 200)
        view.addSubview(picker)
        picker.didMoveToSuperview()
        super.init()
        picker.delegate = self
        picker.dataSource = self
        
    }
    public init(_ view:UIView,_ item:[String],_ selectLinstener:@escaping (_ position:String) -> Void,_ color:UIColor,_ height:Int) {
        super.init()
        callback=selectLinstener
        self.item=item
        picker.delegate=self
        picker.dataSource=self
        picker.backgroundColor = color
        picker.frame=CGRect(x: 0,y: view.frame.maxY-CGFloat(height),width: view.frame.width,height: CGFloat(height))
        view.addSubview(picker)
        picker.didMoveToSuperview()
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return item.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(item[row])
        return item[row]
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select\(pickerView.selectedRow(inComponent: 0))")
        callback(item[pickerView.selectedRow(inComponent: 0)])
        visible(false)
    }
    
    public func notifyDataSetChange(){
        picker.reloadAllComponents()
    }
    public func visible(_ a:Bool){
        picker.isHidden = !a
    }
    
    public func resetitem(_ item:[String]){
        self.item=item
        notifyDataSetChange()
    }
    
    
}
