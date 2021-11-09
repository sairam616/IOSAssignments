//
//  ImageManager.swift
//  ImageViewer
//
//  Created by SaiRam Avala on 2021-11-08.
//

import Foundation
class ImageManager {
    
    private var images = [imageList]()
    
    func addNewImage(ni:imageList){
        images.append(ni)
    }
    
    func getAllImages() -> [imageList]{
        return images
    }
    
}
