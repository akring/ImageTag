import Foundation
import UIKit

public class ImageTagView: UILabel {
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    /// 添加单个 Tag
    ///
    /// - Parameters:
    ///   - tagText: Tag 文本
    ///   - config: Tag 属性配置
    public func addTag(tagText: String, config: TagConfig) {
        let tagString = self.attributedTagString(from: ImageTag(text: tagText, config: config))
        reload(tagString: tagString)
    }
    
    /// 批量添加 Tag，同一批添加的 Tag 会具备相同的属性配置
    ///
    /// - Parameters:
    ///   - tagTextArray: Tag 文本数组
    ///   - config: Tag 属性配置
    public func addTagArray(tagTextArray: [String], config: TagConfig) {
        let tagString = self.attributedTagArrayString(from: tagTextArray.map({ImageTag(text: $0, config: config)}))
        reload(tagString: tagString)
    }
    
    /// 刷新数据
    ///
    /// - Parameter tagString: Tag 字符串
    func reload(tagString: NSAttributedString) {
        guard let currentString = self.attributedText else {
            self.attributedText = tagString
            return;
        }
        let currentMutable = NSMutableAttributedString(attributedString: currentString)
        currentMutable.append(tagString)
        self.attributedText = currentMutable
    }
}

extension ImageTagView {
    /// 多个标签文本转换为 NSAttributedString
    ///
    /// - Parameters:
    ///   - text: 标签文本
    ///   - config: Tag 配置
    /// - Returns: NSAttributedString
    func attributedTagArrayString(from tagArray: [ImageTag]) -> NSAttributedString {
        
        return tagArray.map({self.attributedTagString(from: $0)})
            .reduce(NSMutableAttributedString(string: "")) { result, current in
                result.append(current)
                return result
        }
    }
    
    /// 单个标签文本转换为 NSAttributedString
    ///
    /// - Parameters:
    ///   - text: 标签文本
    ///   - config: Tag 配置
    /// - Returns: NSAttributedString
    func attributedTagString(from tag: ImageTag) -> NSAttributedString {
        
        let attachment = NSTextAttachment()
        attachment.image = self.imageTag(from: tag.text, config: tag.config)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = tag.config.lineSpacing
        paragraphStyle.lineBreakMode = tag.config.lineBreakMode
        
        let attributed = NSMutableAttributedString(attachment: attachment)
        attributed.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributed.length))
        return attributed
    }
    
    /// 将文本转换为标签 Image
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - config: Tag 配置
    /// - Returns: 标签 Image
    func imageTag(from text: String, config: TagConfig) -> UIImage? {
        let label = UITextView(frame: .zero)
        label.text = text
        label.font = config.font
        label.textColor = config.textColor
        label.backgroundColor = config.backgroundColor
        label.textContainerInset = config.containerInset
        label.layer.masksToBounds = true
        label.layer.borderWidth = config.borderWidth
        label.layer.borderColor = config.borderColor
        label.sizeToFit()
        label.layer.cornerRadius = config.borderCornerRadius
        
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: label.bounds.width + config.horizonPadding, height: label.bounds.height))
        bgView.backgroundColor = .clear
        bgView.addSubview(label)
        
        return self.image(from: bgView)
    }
    
    /// 将 UIView 转换为 UIImage
    ///
    /// - Parameter view: UIView
    /// - Returns: UIImage
    func image(from view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
