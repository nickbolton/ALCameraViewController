//
//  PhotoLibraryAuthorizer.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2016/03/26.
//  Copyright © 2016 zero. All rights reserved.
//

import UIKit
import Photos

public typealias PhotoLibraryAuthorizerCompletion = (error: NSError?) -> Void

class PhotoLibraryAuthorizer {

    private let errorDomain = "com.zero.imageFetcher"
    private var completionHandler: PhotoLibraryAuthorizerCompletion?

    init(completion: PhotoLibraryAuthorizerCompletion) {
        completionHandler = completion
        handleAuthorization(status: PHPhotoLibrary.authorizationStatus())
    }
    
    func onDeniedOrRestricted() {
        let error = errorWithKey("error.access-denied", domain: errorDomain)
        completionHandler?(error: error)
    }
    
    func handleAuthorization(status: PHAuthorizationStatus) {
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(handleAuthorization)
            break
        case .authorized:
            DispatchQueue.main.async {
                self.completionHandler?(error: nil)
            }
            break
        case .denied, .restricted:
            DispatchQueue.main.async {
                self.onDeniedOrRestricted()
            }
            break
        }
    }
}
