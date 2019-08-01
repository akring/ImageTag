import Foundation
import UIKit

struct ImageTag {
    /// Tag 文本
    var text: String
    /// Tag 属性配置
    var config: TagConfig
    init(text: String, config: TagConfig) {
        self.text = text
        self.config = config
    }
}


