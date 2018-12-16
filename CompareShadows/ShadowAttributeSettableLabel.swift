import UIKit

@IBDesignable class ShadowAttributeSettableLabel : UILabel {
    @IBInspectable var shadowColorForCustom: UIColor = .clear
    @IBInspectable var shadowOffsetForCustom: CGSize = .zero
    @IBInspectable var shadowRadiusForCustom: CGFloat = 0.0
    @IBInspectable var shadowUIColor: UIColor = .clear {
        didSet {
            layer.shadowColor = shadowUIColor.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let text = text, let attributed = attributedText else { return }
        let mutable = NSMutableAttributedString(attributedString: attributed)
        let shadow = createShadow()
        let range = NSRange(location: 0, length: text.count)
        mutable.addAttribute(.shadow, value: shadow, range: range)
        attributedText = mutable
    }
    
    private func createShadow() -> NSShadow {
        let shadow = NSShadow()
        shadow.shadowColor = shadowColorForCustom
        shadow.shadowOffset = shadowOffsetForCustom
        shadow.shadowBlurRadius = shadowRadiusForCustom
        return shadow
    }
}
