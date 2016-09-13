//
//  PhotoLibraryAuthorizer.swift
//  ALCameraViewController
//
//  Created by Alex Littlejohn on 2016/03/26.
//  Copyright © 2016 zero. All rights reserved.
//

import UIKit
import Photos

public typealias PhotoLibraryAuthorizerCompletion = (_ error: NSError?) -> Void

class PhotoLibraryAuthorizer {

    private let errorDomain = "com.zero.imageFetcher"
    private var completionHandler: PhotoLibraryAuthorizerCompletion?

    init(completion: @escaping PhotoLibraryAuthorizerCompletion) {
        completionHandler = completion
        handleAuthorization(status: PHPhotoLibrary.authorizationStatus())
    }
    
    func onDeniedOrRestricted() {
        let error = errorWithKey("error.access-denied", domain: errorDomain)
        completionHandler?(error)
    }
    
    func handleAuthorization(status: PHAuthorizationStatus) {
        switch status {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(handleAuthorization)
            break
        case .authorized:
            DispatchQueue.main.async {
                self.completionHandler?(nil)
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
