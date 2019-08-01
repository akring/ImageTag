![header](https://raw.githubusercontent.com/akring/ImageTag/master/head.jpg?token=ABRZCZWV3ZOS3MXCMJILMD25IKM7A)

[![forthebadge](https://forthebadge.com/images/badges/made-with-swift.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)

# Summary

Tag View for iOS

## Install

*Swift Package Manager Only*

## Useage

```swift
let tags = ["Easy", "Tag", "via", "Swift"]
let configRed = TagConfig()
tagView.addTagArray(tagTextArray: tags, config: config)
```

## Custom

Custom tag with `TagConfig`:

```swift
/// 字体
public var font: UIFont
/// 文字颜色
public var textColor: UIColor
/// 背景色
public var backgroundColor: UIColor
/// 文字边距
public var containerInset: UIEdgeInsets
/// 边框宽度
public var borderWidth: CGFloat
/// 边框颜色
public var borderColor: CGColor
/// 边框圆角
public var borderCornerRadius: CGFloat
/// Tag 横向间距
public var horizonPadding: CGFloat
/// 行间距
public var lineSpacing: CGFloat
/// 折行模式
public var lineBreakMode: NSLineBreakMode
```
