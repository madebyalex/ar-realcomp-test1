//
//  ViewController.swift
//  AR_RealComp_Test1
//
//  Created by Alexander on 15.11.2020.
//  Copyright © 2020 Alexander Nuzhnyi. All rights reserved.
//


import UIKit
import ARKit
import RealityKit

class ARController: UIViewController {
    var arView = ARView(frame: .zero)
    
    override func loadView() {
        super.loadView()
        view.addSubview(arView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        arView.frame = view.frame
        
        Hexagon.loadSceneAsync {(result) in
            do {
                let hexagonScene = try result.get()
                self.arView.scene.addAnchor(hexagonScene)

            } catch {
                print(error)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        arView.session.run(configuration)
    }
}

//import UIKit
//import RealityKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet var arView: ARView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Load the "Box" scene from the "Experience" Reality File
//        let boxAnchor = try! Experience.loadBox()
//
//        // Add the box anchor to the scene
//        arView.scene.anchors.append(boxAnchor)
//    }
//}
