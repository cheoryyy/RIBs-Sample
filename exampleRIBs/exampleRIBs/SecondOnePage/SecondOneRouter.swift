//
//  SecondOneRouter.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs

protocol SecondOneInteractable: Interactable {
    var router: SecondOneRouting? { get set }
    var listener: SecondOneListener? { get set }
}

protocol SecondOneViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SecondOneRouter: ViewableRouter<SecondOneInteractable, SecondOneViewControllable>, SecondOneRouting {
    

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SecondOneInteractable, viewController: SecondOneViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
