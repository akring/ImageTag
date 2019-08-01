import Foundation
import UIKit

/// 标签配置
public struct TagConfig {
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
    
    public init() {
        self.font = UIFont.systemFont(ofSize: 9, weight: .regular)
        self.textColor = UIColor.black
        self.backgroundColor = UIColor.white
        self.containerInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        self.borderWidth = 0.0
        self.borderColor = UIColor.clear.cgColor
        self.borderCornerRadius = 0.0
        self.horizonPadding = 5
        self.lineSpacing = 5
        self.lineBreakMode = .byCharWrapping
    }
}

