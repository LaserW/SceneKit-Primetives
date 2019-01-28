//
//  MiniWorld.swift
//  SceneKit Primetives
//
//  Created by Березин Дмитрий Борисович on 28/01/2019.
//  Copyright © 2019 Dmitry Berezin. All rights reserved.
//
import UIKit
import SceneKit

class MiniWorld: UIViewController {
    
    
    func loadWorld() -> SCNNode {
        let world = SCNNode()
        
        let sea = SCNNode(geometry: SCNBox(width: 10, height: 0, length: 10, chamferRadius: 0))
        sea.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        sea.opacity = 0.5

        sea.position.z -= 0
        sea.position.x -= 0
        sea.position.y += 0.4
        
        let forest = loadForest()
        let forest1 = loadForest()
        let forest2 = loadForest()
        
        let mountain = loadMountains()
        let mountain1 = loadMountains()
        let mountain2 = loadMountains()
        
        
        forest.position.z = 0
        forest.position.x = 0
        forest1.position.z += 1
        forest1.position.x += 0
        forest2.position.z += 0
        forest2.position.x += 1
        
        mountain.position.z += 2
        mountain.position.x += 0
        mountain1.position.z += 1
        mountain1.position.x += 1
        mountain2.position.z += 2
        mountain2.position.x += 1
        
        ///
        world.position.z += 1
        world.position.y -= 2
        
        world.runAction(    //buildingNode
            .repeatForever(
                .rotateBy(x: 0, y: -.pi, z: 0, duration: 10)
            )
        )
        
        //world.addChildNode(buildingNode)
        world.addChildNode(sea)
        
        world.addChildNode(forest)
        world.addChildNode(forest1)
        world.addChildNode(forest2)
        
        world.addChildNode(mountain)
        world.addChildNode(mountain1)
        world.addChildNode(mountain2)
        
        return world
    }
    
    /////////////////////
    /////////////////////
    
    func loadForest() -> SCNNode {
        
        let forestNode = SCNNode()
        let cubeNode = loadCube()
        cubeNode.position.z += 0    //влево-вправо
        cubeNode.position.x += 0 //вперёд-назад
        cubeNode.position.y += 0 //вверх-вниз
        
        let treeNode = loadTree()
        treeNode.scale = SCNVector3(0.2,0.2,0.2)
        treeNode.position.z += 0.1    //влево-вправо
        treeNode.position.x -= 0.1  //вперёд-назад
        treeNode.position.y += 0.8 //вверх-вниз
        
        let treeNode1 = loadTree()
        treeNode1.scale = SCNVector3(0.15,0.15,0.15)
        treeNode1.position.z += 0.2
        treeNode1.position.x += 0.3
        treeNode1.position.y += 0.6
        
        let treeNode2 = loadTree()
        treeNode2.scale = SCNVector3(0.1,0.1,0.1)
        treeNode2.position.z -= 0.3
        treeNode2.position.x += 0.1
        treeNode2.position.y += 0.6
        
        let treeNode3 = loadTree()
        treeNode3.scale = SCNVector3(0.16,0.16,0.16)
        treeNode3.position.z += 0.4
        treeNode3.position.x -= 0
        treeNode3.position.y += 0.7
        //Geometry

        
        forestNode.addChildNode(cubeNode)
        forestNode.addChildNode(treeNode)
        forestNode.addChildNode(treeNode1)
        forestNode.addChildNode(treeNode2)
        forestNode.addChildNode(treeNode3)
        
        return forestNode
    }
    
    
    
    func loadCube() -> SCNNode {
        let cubeNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
        cubeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        
        return cubeNode
    }
    
    func loadTree() -> SCNNode {
        let treeNode = SCNNode()
        let cylinderNode = loadCylinder()
        let sphereNode = loadSphere()
        
        
        treeNode.addChildNode(cylinderNode)
        treeNode.addChildNode(sphereNode)
        
        return treeNode
    }
    
    func loadCylinder() -> SCNNode {
        let cylinder = SCNNode(geometry: SCNCylinder(radius: 0.1, height: 2))
        cylinder.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        return cylinder
    }
    
    func loadSphere() -> SCNNode {
        let sphere = SCNNode(geometry: SCNSphere(radius: 1))
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        sphere.position.y += 1.5
        return sphere
    }
    
    
    
    
    
    
    func loadMountains() -> SCNNode {
        
        let mountainsNode = SCNNode()
        let cubeNode = loadCube()
        cubeNode.position.z += 0    //влево-вправо
        cubeNode.position.x += 0 //вперёд-назад
        cubeNode.position.y += 0 //вверх-вниз
        
        let mountainNode = loadPyramid()
        mountainNode.scale = SCNVector3(0.4,0.4,0.4)
        mountainNode.position.z += 0.0    //влево-вправо
        mountainNode.position.x -= 0.1  //вперёд-назад
       // mountainNode.position.y += 0.8 //вверх-вниз
        
        let mountainNode1 = loadPyramid()
        mountainNode1.scale = SCNVector3(0.3,0.3,0.3)
        mountainNode1.position.z += 0.1
        mountainNode1.position.x += 0.1
        //mountainNode1.position.y += 0.6
        
        let mountainNode2 = loadPyramid()
        mountainNode2.scale = SCNVector3(0.2,0.2,0.2)
        mountainNode2.position.z -= 0.2
        mountainNode2.position.x -= 0.2
        //mountainNode2.position.y += 0.6
        
        let mountainNode3 = loadPyramid()
        mountainNode3.scale = SCNVector3(0.2,0.2,0.2)
        mountainNode3.position.z += 0.2
        mountainNode3.position.x -= 0.3
       // mountainNode3.position.y += 0.7
        //Geometry
        
        
        mountainsNode.addChildNode(cubeNode)
        mountainsNode.addChildNode(mountainNode)
        mountainsNode.addChildNode(mountainNode1)
        mountainsNode.addChildNode(mountainNode2)
        mountainsNode.addChildNode(mountainNode3)
        
        return mountainsNode
    }
    
    func loadPyramid() -> SCNNode {
        let pyramid = SCNNode(geometry: SCNPyramid(width: 1, height: 1, length: 1))
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.gray
        pyramid.position.y += 0.6
        return pyramid
    }
    
}

