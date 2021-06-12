import UIKit

class Label: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.midY
        layer.masksToBounds = true
    }
}
