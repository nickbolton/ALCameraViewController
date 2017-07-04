//
//  CropOverlay.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2015/06/30.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit

internal class CropOverlay: UIImageView {
    
    internal init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        isUserInteractionEnabled = false
        
        let imageView = UIImageView()
        
        let image = UIImage(named: "cameraOutline", in: CameraGlobals.shared.bundle, compatibleWith: nil)
        let cameraOverlay = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        [.left, .right, .top, .bottom].forEach({
            self.addConstraint(NSLayoutConstraint(
                item: imageView,
                attribute: $0,
                relatedBy: .equal,
                toItem: self,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })
    }
}
