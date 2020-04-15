//
//  File.swift
//  
//
//  Created by Alexander Cyon on 2020-04-15.
//

import Foundation
import SceneKit

enum SceneKit3DGraphics {}
extension SceneKit3DGraphics {
    static func drawStuff() {
        
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        cameraNode.position = SCNVector3(x: -3.0, y: 3.0, z: 3.0)
        
        let light = SCNLight()
        light.type = .spot
        light.spotInnerAngle = 30.0
        light.spotOuterAngle = 80.0
        light.castsShadow = true
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
        
        let cubeGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = NSColor.red
        cubeGeometry.materials = [redMaterial]
        let cubeNode = SCNNode(geometry: cubeGeometry)
        
        let torusGeometry = SCNTorus(ringRadius: 0.4, pipeRadius: 0.1)
        let goldMaterial = SCNMaterial()
        goldMaterial.lightingModel = .physicallyBased
        goldMaterial.metalness.contents = 1.0
        goldMaterial.roughness.contents = 0.0
        goldMaterial.diffuse.contents = NSColor(red: 0.95, green: 0.75, blue: 0.1, alpha: 1)
        torusGeometry.materials = [goldMaterial]
        let torusNode = SCNNode(geometry: torusGeometry)
        cubeNode.addChildNode(torusNode)
        
        
        let constraint = SCNLookAtConstraint(target: cubeNode)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.color = NSColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
        cameraNode.light = ambientLight
        lightNode.constraints = [constraint]
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = NSColor.green
        let planeGeometry = SCNPlane(width: 50.0, height: 50.0)
        planeGeometry.materials = [greenMaterial]
        let planeNode = SCNNode(geometry: planeGeometry)
        
        planeNode.eulerAngles = SCNVector3(
            x: CGFloat(GLKMathDegreesToRadians(-90)),
            y: 0,
            z: 0
        )
        
        planeNode.position = SCNVector3(x: 0, y: -0.5, z: 0)
        
        
        
        let scene = SCNScene()
        
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(cubeNode)
        scene.rootNode.addChildNode(planeNode)
        
        var posCube = cubeNode.position
        posCube.y = posCube.y + cubeGeometry.height/2 + torusGeometry.pipeRadius
        torusNode.position = posCube
        
        
        let sceneView = SCNView(frame: NSRect(x: 0, y: 0, width: 2000, height: 2000))
        sceneView.allowsCameraControl = true
        sceneView.scene = scene
        UserInterface.show(view: sceneView)
        
    }
    
}
