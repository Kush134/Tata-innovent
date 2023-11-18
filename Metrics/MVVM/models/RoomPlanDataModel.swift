//
//  RoomPlanDataModel.swift
//  Metrics
//
//  Created by Agrim Srivastava on 27/03/23.
//

import Foundation
import UIKit
import RoomPlan

struct RoomPlan {
    var name: String
    var floorPlanImage: UIImage
    var items: [FurnitureItem]
}

struct FurnitureItem {
    var name: String
    var image: UIImage
    var position: CGPoint
    var rotation: CGFloat
}

//struct CapturedRoom {
//    let name: String
//    let roomScanFileURL: URL
//    let floorPlanImageURL: URL
//    let meshFileURL: URL
//    let thumbnailImageURL: URL
//    let createdDate: Date
//
//    init(name: String, roomScanFileURL: URL, floorPlanImageURL: URL, meshFileURL: URL, thumbnailImageURL: URL, createdDate: Date) {
//        self.name = name
//        self.roomScanFileURL = roomScanFileURL
//        self.floorPlanImageURL = floorPlanImageURL
//        self.meshFileURL = meshFileURL
//        self.thumbnailImageURL = thumbnailImageURL
//        self.createdDate = createdDate
//    }
//}


var capturedRoom = [CapturedRoom] ()
