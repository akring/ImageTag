# ImageTag

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

```
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
