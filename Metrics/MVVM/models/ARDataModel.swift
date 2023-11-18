//
//  ARDataModel.swift
//  Metrics
//
//  Created by Agrim Srivastava on 13/03/23.
//

import Foundation
import SceneKit
import ARKit

struct Furniture {
    var title: String
    var image: UIImage?
    var geometry: SCNGeometry
    var material: [SCNMaterial]
    var transform: SCNMatrix4
    var anchor: ARAnchor
    var scene: SCNScene
    
}

struct Model {
    let design: Any
}


