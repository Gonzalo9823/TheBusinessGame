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
    var moverDerecha = SKAction(named: "MoverDerecha")!
    var moverIzquierda = SKAction(named: "MoverIzquierda")!
    enum Espacio {
        case Principal, Derecho, Izquierdo
    }
    var estadoActual: Espacio = .Principal
    
    override func didMoveToView(view: SKView) {
        rightButton = childNodeWithName("//rightButton") as! MSButtonNode
        leftButton = childNodeWithName("//leftButton") as! MSButtonNode
        
        rightButton.selectedHandler = {
            if self.estadoActual == .Principal {
                //self.camera?.position.x += 375
                self.camera?.runAction(self.moverDerecha)
                self.estadoActual = .Derecho
            }
            else if self.estadoActual == .Izquierdo {
                self.camera?.runAction(self.moverDerecha)
                self.estadoActual = .Principal
            }
        }
        
        leftButton.selectedHandler = {
            if self.estadoActual == .Principal {
                self.camera?.runAction(self.moverIzquierda)

                self.estadoActual = .Izquierdo
            }
            else if self.estadoActual == .Derecho {
                self.camera?.runAction(self.moverIzquierda)
                self.estadoActual = .Principal
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
