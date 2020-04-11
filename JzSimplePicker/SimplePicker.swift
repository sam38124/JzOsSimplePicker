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
    var button:UIButton! = nil
    public init(_ view:UIView,_ item:[String],_ selectLinstener:@escaping (_ position:String) -> Void,_ donecolor:UIColor=UIColor.black) {
        super.init()
        callback=selectLinstener
        self.item=item
        picker.backgroundColor = .white
        let color1 = UIColor.black
        //        let color2 = UIColor.white
        picker.setValue(color1, forKey: "textColor")
        picker.frame=CGRect(x: 0,y: view.frame.maxY-200,width: view.frame.width,height: 200)
        button = UIButton(frame: CGRect(x: view.frame.width-50, y: view.frame.maxY-200, width: 50, height: 40))
        button.setTitleColor(donecolor, for: .normal)
        button.setTitle("done", for: .normal)
        button.addTarget(self, action: #selector(self.newButtonAction), for: .touchUpInside)
        view.addSubview(picker)
        view.addSubview(button)
        picker.didMoveToSuperview()
        picker.delegate = self
        picker.dataSource = self
        close()
    }
    @objc func newButtonAction(sender: UIButton!) {
        close()
        callback(item![picker.selectedRow(inComponent: 0)])
    }
    public init(_ view:UIView,_ item:[String],_ selectLinstener:@escaping (_ position:String) -> Void,_ color:UIColor,_ height:Int,_ donecolor:UIColor=UIColor.black) {
        super.init()
        callback=selectLinstener
        self.item=item
        picker.delegate=self
        picker.dataSource=self
        picker.backgroundColor = color
        picker.frame=CGRect(x: 0,y: view.frame.maxY-CGFloat(height),width: view.frame.width,height: CGFloat(height))
        button =  UIButton(frame: CGRect(x: view.frame.width-50, y: view.frame.maxY-CGFloat(height), width: 50, height: 40))
        button.setTitle("done", for: .normal)
        button.setTitleColor(donecolor, for: .normal)
        button.addTarget(self, action: #selector(self.newButtonAction), for: .touchUpInside)
        view.addSubview(picker)
        view.addSubview(button)
        picker.didMoveToSuperview()
        close()
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
        close()
    }
    
    public func notifyDataSetChange(){
        picker.reloadAllComponents()
    }
    public func open(){
        picker.isHidden = false
        if(button != nil){button.isHidden = false}
    }
    public func close(){
        picker.isHidden = true
        if(button != nil){button.isHidden = true}
        
    }
    public func resetitem(_ item:[String]){
        self.item=item
        notifyDataSetChange()
    }
    
    
}
