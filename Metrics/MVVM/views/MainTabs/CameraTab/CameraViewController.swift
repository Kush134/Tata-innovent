//
//  ViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 28/01/23.
//

import UIKit
import RealityKit
import ARKit
import SwiftUI


class CameraViewController: UIViewController, ARSCNViewDelegate, SCNSceneRendererDelegate {
    

    
    @IBOutlet weak var containerARView: UIView!
    
    @IBOutlet weak var containerRoomCaptureView: UIView!
    @IBOutlet weak var containerMeasureView: UIView!
    @IBOutlet var segmentButton: UISegmentedControl!
    @IBOutlet weak var shareButton: UIButton!
    //ARKit
    let sessionConfiguration = ARWorldTrackingConfiguration()
//    guard let referenceObjects = ARReferenceObject.referenceObjects(inGroupNamed: "gallery", bundle: nil) else {
//        fatalError("Message expected asset catalog resource.")
//    }
//    sessionConfiguration.detectionObjects = referenceObjects
//    sceneView.session.run(sessionConfiguration)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
        setUp()
        }
    
    func setUp() {
        containerMeasureView.isHidden = false
        containerRoomCaptureView.isHidden = true
    }
    
    @IBAction func didTapSegment(_ sender: UISegmentedControl) {
        containerMeasureView.isHidden = false
        containerRoomCaptureView.isHidden = true
        
        if sender.selectedSegmentIndex == 0 {
            containerMeasureView.isHidden = false
            containerRoomCaptureView.isHidden = true
        }
        else {
            containerMeasureView.isHidden = true
            containerRoomCaptureView.isHidden = false
        }
    }
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        if segmentButton.selectedSegmentIndex == 0 {
            let shareText = "Check out this cool thing I found!"
                let shareURL = URL(string: "https://www.example.com/cool-thing")!

                let activityViewController = UIActivityViewController(activityItems: [shareText, shareURL], applicationActivities: nil)

                present(activityViewController, animated: true, completion: nil)
        }
        else {
            let destinationURL = FileManager.default.temporaryDirectory.appending(path: "Room.usdz")
            //Metrics.capturedRoom.append(finalResults!)
            do {
                try RoomCaptureViewController().finalResults?.export(to: destinationURL, exportOptions: .parametric)
                
                let activityVC = UIActivityViewController(activityItems: [destinationURL], applicationActivities: nil)
                activityVC.modalPresentationStyle = .popover
                
                present(activityVC, animated: true, completion: nil)
                if let popOver = activityVC.popoverPresentationController {
                    popOver.sourceView = self.shareButton
                }
            } catch {
                print("Error = \(error)")
            }
        }
    }
    
    @IBSegueAction func showSwiftUi(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView(model: CameraViewModel()))
    }
}



