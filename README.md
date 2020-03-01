[![Platform](https://img.shields.io/badge/平台-%20IOS%20-brightgreen.svg)](https://github.com/sam38124)
[![characteristic](https://img.shields.io/badge/特點-%20輕量級%20%7C%20簡單易用%20%20%7C%20穩定%20-brightgreen.svg)](https://github.com/sam38124)
#### 非常簡單使用的PickerView
## 目錄
* [如何導入到專案](#Import)
* [快速使用](#use)
* [關於我](#About)

<a name="Import"></a>
## 如何導入到項目
> 支持framework導入。 <br/>

#### 1.首先將framework拉入要導入的Project當中
<img src="https://github.com/sam38124/JzOsFrameWork/blob/master/i2.png" width = "800"  alt="i1" /><a name="Use"></a>
#### 2.將三個選項打勾
<img src="https://github.com/sam38124/JzOsFrameWork/blob/master/i1.png" width = "800"  alt="i1" /><a name="Use"></a>
#### 3.選擇Embed and signed
<img src="https://github.com/sam38124/JzOsFrameWork/blob/master/i3.png" width = "800"  alt="i1" />

<a name="use"></a>
## 橫向佈局

#### 1.宣告pickerView
```swift
    var make:SimplePicker! = nil
```
#### 2.設定pickerView(必須在ViewDidApper後設定)
```swift
//view為你要放置pickerview的地方
//[String]()為你的數據源
//backcolor為你的pickerview背景顏色
//view.frame.width/1.7 為你的pickerview高度
make=SimplePicker(view,[String](), {rebackitem in
//監聽選擇回調
           var selectmake= rebackitem
        },UIColor(named: "backcolor")!,Int(view.frame.width/1.7))
```
#### 3.重設數據源
```swift
make.resetitem(makeitem)
```
#### 4.開啟pickerView
```swift
make.visible(false)
```

<a name="About"></a>
### 關於我
橙的電子android and ios developer

*line:sam38124

*gmail:sam38124@gmail.com
