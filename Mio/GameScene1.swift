//
//  GameScene.swift
//  Mio
//
//  Created by Gonzalo Caballero on 6/27/16.
//  Copyright (c) 2016 Gonzalo Caballero. All rights reserved.
//

import SpriteKit

class GameScene1: SKScene {
    
    var rightButton: MSButtonNode!
    var leftButton: MSButtonNode!
    var botonMenu: MSButtonNode!
    var moverDerecha = SKAction(named: "MoverDerecha")!
    var moverIzquierda = SKAction(named: "MoverIzquierda")!
    var menuNode:  SKNode!
    var paraSaberSiBajaOSube = true
    
    enum Espacio {
        case Principal, Derecho, Izquierdo
    }
    
    var estadoActual: Espacio = .Principal
    
    override func didMoveToView(view: SKView) {
        rightButton = childNodeWithName("//rightButton") as! MSButtonNode
        leftButton = childNodeWithName("//leftButton") as! MSButtonNode
        botonMenu = childNodeWithName("//botonMenu") as! MSButtonNode
        
        rightButton.selectedHandler = {
            if self.estadoActual == .Principal {
                //self.camera?.position.x += 375
                self.camera?.runAction(self.moverDerecha)
                self.estadoActual = .Derecho
                self.bajarMenus()
            }
            else if self.estadoActual == .Izquierdo {
                self.camera?.runAction(self.moverDerecha)
                self.estadoActual = .Principal
                self.bajarMenus()
            }
        }
        
        leftButton.selectedHandler = {
            if self.estadoActual == .Principal {
                self.camera?.runAction(self.moverIzquierda)
                
                self.estadoActual = .Izquierdo
                self.bajarMenus()
                
            }
            else if self.estadoActual == .Derecho {
                self.camera?.runAction(self.moverIzquierda)
                self.estadoActual = .Principal
                self.bajarMenus()
            }
        }
        
        botonMenu.selectedHandler = {
            
            switch self.estadoActual {
            case .Principal:
                self.subirPrincipal(self.paraSaberSiBajaOSube)
            case .Izquierdo:
                self.subirIzquierdo(self.paraSaberSiBajaOSube)
            case .Derecho:
                self.subirDerecho(self.paraSaberSiBajaOSube)
            }
            
        }
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    //--------------------------------------------------------------
    
    func subirPrincipal(subirObajar: Bool) {
        
        self.menuNode = self.childNodeWithName("//menuNodePrincipal")
        let resourcePath = NSBundle.mainBundle().pathForResource("Menu", ofType: "sks")
        let mostrarMenu = SKReferenceNode (URL: NSURL (fileURLWithPath: resourcePath!))
        self.menuNode.addChild(mostrarMenu)
        
        if subirObajar {
            let moverse = SKAction(named: "subirMenuPrincipal")
            self.menuNode.runAction(moverse!)
            paraSaberSiBajaOSube = false
        } else {
            let moverse = SKAction(named: "bajarMenuPrincipal")
            self.menuNode.runAction(moverse!)
            paraSaberSiBajaOSube = true
        }
    }
    func subirDerecho(subirOBajar: Bool) {
        
        self.menuNode = self.childNodeWithName("//menuNodeDerecha")
        let resourcePath = NSBundle.mainBundle().pathForResource("Menu", ofType: "sks")
        let mostrarMenu = SKReferenceNode (URL: NSURL (fileURLWithPath: resourcePath!))
        self.menuNode.addChild(mostrarMenu)
        
        
        if subirOBajar {
            let moverse = SKAction(named: "subirMenuDerecha")
            self.menuNode.runAction(moverse!)
            paraSaberSiBajaOSube = false
        } else {
            let moverse = SKAction(named: "bajarMenuDerecha")
            self.menuNode.runAction(moverse!)
            paraSaberSiBajaOSube = true
        }
    }
    
    func subirIzquierdo(subirObajar: Bool) {
        
        self.menuNode = self.childNodeWithName("//menuNodeIzquierdo")
        let resourcePath = NSBundle.mainBundle().pathForResource("Menu", ofType: "sks")
        let mostrarMenu = SKReferenceNode (URL: NSURL (fileURLWithPath: resourcePath!))
        self.menuNode.addChild(mostrarMenu)
        
        if subirObajar {
            let moverse = SKAction(named: "subirMenuIzquierdo")
            self.menuNode.runAction(moverse!)
            paraSaberSiBajaOSube = false
        } else {
            let moverse = SKAction(named: "bajarMenuIzquierdo")
            self.menuNode.runAction(moverse!)
            paraSaberSiBajaOSube = true
        }
    }
    
    
    func bajarMenus() {
        subirPrincipal(false)
        subirDerecho(false)
        subirIzquierdo(false)
    }
}


























