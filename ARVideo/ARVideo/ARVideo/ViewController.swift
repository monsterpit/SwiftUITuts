//
//  ViewController.swift
//  ARVideo
//
//  Created by Mojave on 10/02/21.
//  Copyright © 2021 Mojave. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var arScn: ARSCNView!
    
    var player: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arScn.delegate = self
    }

    func addARTV(){
        
        let fileURL = URL(fileURLWithPath: Bundle.main.path(forResource: "iphoneX", ofType: "mp4")!)
        player = AVPlayer(url: fileURL)
        
        let tvGeo = SCNPlane(width: 1.6, height: 0.9)
        tvGeo.firstMaterial?.diffuse.contents = player
        tvGeo.firstMaterial?.isDoubleSided = true
        let tvNode = SCNNode(geometry: tvGeo)
        
        arScn.scene.rootNode.addChildNode(tvNode)
        
        player.play()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        arScn.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addARTV()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arScn.session.pause()
    }

}

extension ViewController: ARSCNViewDelegate{
    
}
