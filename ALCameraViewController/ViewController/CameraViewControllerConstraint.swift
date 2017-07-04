//
//  CameraViewControllerConstraint.swift
//  CameraViewControllerConstraint
//
//  Created by Pedro Paulo de Amorim.
//  Copyright (c) 2016 zero. All rights reserved.
//

import UIKit
import AVFoundation

/**
 * This extension provides the configuration of
 * constraints for CameraViewController.
 */
extension CameraViewController {
    
    /**
     * To attach the view to the edges of the superview, it needs
     to be pinned on the sides of the self.view, based on the
     edges of this superview.
     * This configure the cameraView to show, in real time, the
     * camera.
     */
    func configCameraViewConstraints() {
        [.left, .right, .top, .bottom].forEach({
            view.addConstraint(NSLayoutConstraint(
                item: cameraView,
                attribute: $0,
                relatedBy: .equal,
                toItem: view,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })
    }
        
    func configHeaderContainerStaticConstraints() {
        [.left, .right, .top].forEach({
            view.addConstraint(NSLayoutConstraint(
                item: headerContainer,
                attribute: $0,
                relatedBy: .equal,
                toItem: view,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })
        
        [.left, .right, .bottom, .top].forEach({
            headerContainer.addConstraint(NSLayoutConstraint(
                item: headerVibrantView,
                attribute: $0,
                relatedBy: .equal,
                toItem: headerContainer,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })

        [.bottom, .top].forEach({
            headerContainer.addConstraint(NSLayoutConstraint(
                item: closeButton,
                attribute: $0,
                relatedBy: .equal,
                toItem: headerContainer,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })

        headerContainer.addConstraint(NSLayoutConstraint(
            item: closeButton,
            attribute: .left,
            relatedBy: .equal,
            toItem: headerContainer,
            attribute: .left,
            multiplier: 1.0,
            constant: 10.0))
        
        headerContainer.addConstraint(NSLayoutConstraint(
            item: headerContainer,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: headerHeight))
    }
    
    func configControlsContainerStaticConstraints() {
        [.left, .right, .bottom].forEach({
            view.addConstraint(NSLayoutConstraint(
                item: controlsContainer,
                attribute: $0,
                relatedBy: .equal,
                toItem: view,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })
        
        [.left, .right, .bottom, .top].forEach({
            controlsContainer.addConstraint(NSLayoutConstraint(
                item: controlsVibrantView,
                attribute: $0,
                relatedBy: .equal,
                toItem: controlsContainer,
                attribute: $0,
                multiplier: 1.0,
                constant: 0))
        })
        
        // library button
        
        libraryControlContainer.addConstraint(NSLayoutConstraint(
            item: libraryButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: libraryControlContainer,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0))
        
        libraryControlContainer.addConstraint(NSLayoutConstraint(
            item: libraryButton,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: libraryControlContainer,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0))
        
        // camera button
        
        cameraFlipControlContainer.addConstraint(NSLayoutConstraint(
            item: swapButton,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: cameraFlipControlContainer,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0))
        
        cameraFlipControlContainer.addConstraint(NSLayoutConstraint(
            item: swapButton,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: cameraFlipControlContainer,
            attribute: .centerY,
            multiplier: 1.0,
            constant: 0))
    }
    
    func configLibraryContainerEdgeConstraints(_ portrait: Bool) {
        controlsContainer.autoRemoveConstraint(libraryControlContainerEdgeConstraintOne)
        controlsContainer.autoRemoveConstraint(libraryControlContainerEdgeConstraintTwo)
        controlsContainer.autoRemoveConstraint(libraryControlContainerEdgeConstraintThree)
        controlsContainer.autoRemoveConstraint(libraryControlContainerEdgeConstraintFour)
        
        libraryControlContainerEdgeConstraintOne = NSLayoutConstraint(
            item: libraryControlContainer,
            attribute: portrait ? .left : .top,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: portrait ? .left : .top,
            multiplier: 1.0,
            constant: 0)
            
        controlsContainer.addConstraint(libraryControlContainerEdgeConstraintOne!)
        
        libraryControlContainerEdgeConstraintTwo = NSLayoutConstraint(
            item: libraryControlContainer,
            attribute: portrait ? .right : .bottom,
            relatedBy: .equal,
            toItem: cameraButton,
            attribute: portrait ? .left : .top,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(libraryControlContainerEdgeConstraintTwo!)
        
        libraryControlContainerEdgeConstraintThree = NSLayoutConstraint(
            item: libraryControlContainer,
            attribute: portrait ? .top : .left,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: portrait ? .top : .left,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(libraryControlContainerEdgeConstraintThree!)
        
        libraryControlContainerEdgeConstraintFour = NSLayoutConstraint(
            item: libraryControlContainer,
            attribute: portrait ? .bottom : .right,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: portrait ? .bottom : .right,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(libraryControlContainerEdgeConstraintFour!)
    }
    
    func configCameraSwapContainerEdgeConstraints(_ portrait: Bool) {
        controlsContainer.autoRemoveConstraint(cameraFlipControlContainerEdgeConstraintOne)
        controlsContainer.autoRemoveConstraint(cameraFlipControlContainerEdgeConstraintTwo)
        controlsContainer.autoRemoveConstraint(cameraFlipControlContainerEdgeConstraintThree)
        controlsContainer.autoRemoveConstraint(cameraFlipControlContainerEdgeConstraintFour)

        cameraFlipControlContainerEdgeConstraintOne = NSLayoutConstraint(
            item: cameraFlipControlContainer,
            attribute: portrait ? .right : .bottom,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: portrait ? .right : .bottom,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(cameraFlipControlContainerEdgeConstraintOne!)
        
        cameraFlipControlContainerEdgeConstraintTwo = NSLayoutConstraint(
            item: cameraFlipControlContainer,
            attribute: portrait ? .left : .top,
            relatedBy: .equal,
            toItem: cameraButton,
            attribute: portrait ? .right : .bottom,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(cameraFlipControlContainerEdgeConstraintTwo!)
        
        cameraFlipControlContainerEdgeConstraintThree = NSLayoutConstraint(
            item: cameraFlipControlContainer,
            attribute: portrait ? .top : .left,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: portrait ? .top : .left,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(cameraFlipControlContainerEdgeConstraintThree!)
        
        cameraFlipControlContainerEdgeConstraintFour = NSLayoutConstraint(
            item: cameraFlipControlContainer,
            attribute: portrait ? .bottom : .right,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: portrait ? .bottom : .right,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(cameraFlipControlContainerEdgeConstraintFour!)
    }
    
    private var controlsContainerHeight: CGFloat {
//        let heightFactor: CGFloat = 0.311844078
//        return round(view.frame.height * heightFactor)
        return 100.0
    }
    
    func configControlsContainerConstraints(_ statusBarOrientation: UIInterfaceOrientation) {
        controlsContainer.autoRemoveConstraint(controlsContainerHeightConstraint)
        controlsContainerHeightConstraint =
            NSLayoutConstraint(
                item: controlsContainer,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1.0,
                constant: controlsContainerHeight)
        controlsContainer.addConstraint(controlsContainerHeightConstraint!)
    }
    
    /**
     * Add the constraints based on the device orientation,
     * this pin the button on the bottom part of the screen
     * when the device is portrait, when landscape, pin
     * the button on the right part of the screen.
     */
    func configCameraButtonEdgeConstraint(_ statusBarOrientation: UIInterfaceOrientation) {
        controlsContainer.autoRemoveConstraint(cameraButtonEdgeConstraint)
        
        let attribute : NSLayoutAttribute = {
            switch statusBarOrientation {
            case .portrait: return .centerY
            case .landscapeRight: return .right
            case .landscapeLeft: return .left
            default: return .centerY
            }
        }()
        
        let constant: CGFloat = {
            switch attribute {
            case .right:
                return -8.0
            case .left:
                return 8.0
            default:
                return 0.0
            }
        }()
        
        cameraButtonEdgeConstraint = NSLayoutConstraint(
            item: cameraButton,
            attribute: attribute,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: attribute,
            multiplier: 1.0,
            constant: constant)
        controlsContainer.addConstraint(cameraButtonEdgeConstraint!)
    }
    
    /**
     * Add the constraints based on the device orientation,
     * centerX the button based on the width of screen.
     * When the device is landscape orientation, centerY
     * the button based on the height of screen.
     */
    func configCameraButtonGravityConstraint(_ portrait: Bool) {
        controlsContainer.autoRemoveConstraint(cameraButtonGravityConstraint)
        let attribute : NSLayoutAttribute = portrait ? .centerX : .centerY
        cameraButtonGravityConstraint = NSLayoutConstraint(
            item: cameraButton,
            attribute: attribute,
            relatedBy: .equal,
            toItem: controlsContainer,
            attribute: attribute,
            multiplier: 1.0,
            constant: 0)
        controlsContainer.addConstraint(cameraButtonGravityConstraint!)
    }
        
    func removeCloseButtonConstraints() {
        controlsContainer.autoRemoveConstraint(closeButtonEdgeConstraint)
        controlsContainer.autoRemoveConstraint(closeButtonGravityConstraint)
    }
    
    /**
     * Pin the close button to the left of the superview.
     */
    func configCloseButtonEdgeConstraint(_ statusBarOrientation : UIInterfaceOrientation) {
        
        let attribute : NSLayoutAttribute = {
            switch statusBarOrientation {
            case .portrait: return .left
            case .landscapeRight, .landscapeLeft: return .centerX
            default: return .right
            }
        }()

        closeButtonEdgeConstraint = NSLayoutConstraint(
            item: closeButton,
            attribute: attribute,
            relatedBy: .equal,
            toItem: attribute != .centerX ? controlsContainer : cameraButton,
            attribute: attribute,
            multiplier: 1.0,
            constant: attribute != .centerX ? 16 : 0)
        controlsContainer.addConstraint(closeButtonEdgeConstraint!)
    }
    
    /**
     * Add the constraint for the CloseButton, based on
     * the device orientation.
     * If portrait, it pin the CloseButton on the CenterY
     * of the CameraButton.
     * Else if landscape, pin this button on the Bottom
     * of superview.
     */
    func configCloseButtonGravityConstraint(_ statusBarOrientation : UIInterfaceOrientation) {
        
        let attribute : NSLayoutAttribute
        let constant : CGFloat
        
        switch statusBarOrientation {
        case .portrait:
            attribute = .centerY
            constant = 0.0
            break
        case .landscapeRight:
            attribute = .bottom
            constant = -16.0
            break
        case .landscapeLeft:
            attribute = .top
            constant = 16.0
            break
        default:
            attribute = .centerX
            constant = 0.0
            break
        }
        
        closeButtonGravityConstraint = NSLayoutConstraint(
            item: closeButton,
            attribute: attribute,
            relatedBy: .equal,
            toItem: attribute == .bottom || attribute == .top ? controlsContainer : cameraButton,
            attribute: attribute,
            multiplier: 1.0,
            constant: constant)
        
        controlsContainer.addConstraint(closeButtonGravityConstraint!)
    }
        
    /**
     * If the device orientation is portrait, pin the top of
     * FlashButton to the top side of superview.
     * Else if, pin the FlashButton bottom side on the top side
     * of SwapButton.
     */
    func configFlashEdgeButtonConstraint(_ statusBarOrientation: UIInterfaceOrientation) {
        view.autoRemoveConstraint(flashButtonEdgeConstraint)
        
        let constraintRight = statusBarOrientation == .portrait || statusBarOrientation == .landscapeRight
        let attribute : NSLayoutAttribute = constraintRight ? .top : .bottom
        
        flashButtonEdgeConstraint = NSLayoutConstraint(
            item: flashButton,
            attribute: attribute,
            relatedBy: .equal,
            toItem: view,
            attribute: attribute,
            multiplier: 1.0,
            constant: constraintRight ? 8 : -8)
        view.addConstraint(flashButtonEdgeConstraint!)
    }
    
    /**
     * If the device orientation is portrait, pin the
     right side of FlashButton to the right side of
     * superview.
     * Else if, centerX the FlashButton on the CenterX
     * of CameraButton.
     */
    func configFlashGravityButtonConstraint(_ statusBarOrientation: UIInterfaceOrientation) {
        view.autoRemoveConstraint(flashButtonGravityConstraint)
        
        let constraintRight = statusBarOrientation == .portrait || statusBarOrientation == .landscapeLeft
        let attribute : NSLayoutAttribute = constraintRight ? .right : .left
        
        flashButtonGravityConstraint = NSLayoutConstraint(
            item: flashButton,
            attribute: attribute,
            relatedBy: .equal,
            toItem: view,
            attribute: attribute,
            multiplier: 1.0,
            constant: constraintRight ? -8 : 8)
        view.addConstraint(flashButtonGravityConstraint!)
    }
    
//    func removeCameraOverlayContainerConstraints() {
//        view.autoRemoveConstraint(cameraOverlayContainerConstraintOne)
//        view.autoRemoveConstraint(cameraOverlayContainerConstraintTwo)
//        view.autoRemoveConstraint(cameraOverlayContainerConstraintThree)
//        view.autoRemoveConstraint(cameraOverlayContainerConstraintFour)
//    }
//    
//    func configCameraOverlayContainerConstraints(_ portrait: Bool) {
//        cameraOverlayContainerConstraintOne = NSLayoutConstraint(
//            item: cameraOverlayContainer,
//            attribute: portrait ? .top : .left,
//            relatedBy: .equal,
//            toItem: headerContainer,
//            attribute: portrait ? .bottom : .right,
//            multiplier: 1.0,
//            constant: 0)
//        view.addConstraint(cameraOverlayContainerConstraintOne!)
//        
//        cameraOverlayContainerConstraintTwo = NSLayoutConstraint(
//            item: cameraOverlayContainer,
//            attribute: portrait ? .bottom : .right,
//            relatedBy: .equal,
//            toItem: controlsContainer,
//            attribute: portrait ? .top : .left,
//            multiplier: 1.0,
//            constant: 0)
//        view.addConstraint(cameraOverlayContainerConstraintTwo!)
//
//        cameraOverlayContainerConstraintThree = NSLayoutConstraint(
//            item: cameraOverlayContainer,
//            attribute: portrait ? .left : .top,
//            relatedBy: .equal,
//            toItem: view,
//            attribute: portrait ? .left : .top,
//            multiplier: 1.0,
//            constant: 0)
//        view.addConstraint(cameraOverlayContainerConstraintThree!)
//
//        cameraOverlayContainerConstraintFour = NSLayoutConstraint(
//            item: cameraOverlayContainer,
//            attribute: portrait ? .right : .bottom,
//            relatedBy: .equal,
//            toItem: view,
//            attribute: portrait ? .right : .bottom,
//            multiplier: 1.0,
//            constant: 0)
//        view.addConstraint(cameraOverlayContainerConstraintFour!)
//    }
    
    /**
     * Used to create a perfect square for CameraOverlay.
     * This method will determinate the size of CameraOverlay,
     * if portrait, it will use the width of superview to
     * determinate the height of the view. Else if landscape,
     * it uses the height of the superview to create the width
     * of the CameraOverlay.
     */
    func configCameraOverlayWidthConstraint(_ portrait: Bool) {
        cameraOverlay.autoRemoveConstraint(cameraOverlayWidthConstraint)
        cameraOverlayWidthConstraint = NSLayoutConstraint(
            item: cameraOverlay,
            attribute: portrait ? .height : .width,
            relatedBy: .equal,
            toItem: cameraOverlay,
            attribute: portrait ? .width : .height,
            multiplier: 1.0,
            constant: 0)
        cameraOverlay.addConstraint(cameraOverlayWidthConstraint!)
    }
    
    /**
     * This method will center the relative position of
     * CameraOverlay, based on the biggest size of the
     * superview.
     */
    func configCameraOverlayCenterConstraint(_ portrait: Bool) {
        view.autoRemoveConstraint(cameraOverlayCenterConstraint)
        let attribute : NSLayoutAttribute = portrait ? .centerY : .centerX
        cameraOverlayCenterConstraint = NSLayoutConstraint(
            item: cameraOverlay,
            attribute: attribute,
            relatedBy: .equal,
            toItem: view,
            attribute: attribute,
            multiplier: 1.0,
            constant: 0)
        view.addConstraint(cameraOverlayCenterConstraint!)
    }
    
    /**
     * Remove the CameraOverlay constraints to be updated when
     * the device was rotated.
     */
    func removeCameraOverlayEdgesConstraints() {
        view.autoRemoveConstraint(cameraOverlayEdgeOneConstraint)
        view.autoRemoveConstraint(cameraOverlayEdgeTwoConstraint)
    }
    
    /**
     * It needs to get a determined smallest size of the screen
     to create the smallest size to be used on CameraOverlay.
     It uses the orientation of the screen to determinate where
     the view will be pinned.
     */
    func configCameraOverlayEdgeOneContraint(_ portrait: Bool, padding: CGFloat) {
        let attribute : NSLayoutAttribute = portrait ? .left : .bottom
        cameraOverlayEdgeOneConstraint = NSLayoutConstraint(
            item: cameraOverlay,
            attribute: attribute,
            relatedBy: .equal,
            toItem: view,
            attribute: attribute,
            multiplier: 1.0,
            constant: padding)
        view.addConstraint(cameraOverlayEdgeOneConstraint!)
    }
    
    /**
     * It needs to get a determined smallest size of the screen
     to create the smallest size to be used on CameraOverlay.
     It uses the orientation of the screen to determinate where
     the view will be pinned.
     */
    func configCameraOverlayEdgeTwoConstraint(_ portrait: Bool, padding: CGFloat) {
        let attributeTwo : NSLayoutAttribute = portrait ? .right : .top
        cameraOverlayEdgeTwoConstraint = NSLayoutConstraint(
            item: cameraOverlay,
            attribute: attributeTwo,
            relatedBy: .equal,
            toItem: view,
            attribute: attributeTwo,
            multiplier: 1.0,
            constant: -padding)
        view.addConstraint(cameraOverlayEdgeTwoConstraint!)
    }
}
