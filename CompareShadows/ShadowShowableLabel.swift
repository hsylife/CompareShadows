import UIKit

@IBDesignable class ShadowUIColorSettableLabel : UILabel {
    @IBInspectable var shadowUIColor: UIColor = .clear {
        didSet {
            layer.shadowColor = shadowUIColor.cgColor
        }
    }
}
