//
//  SecondTwoRouter.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs

protocol SecondTwoInteractable: Interactable {
    var router: SecondTwoRouting? { get set }
    var listener: SecondTwoListener? { get set }
}

protocol SecondTwoViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func dismiss(viewController: ViewControllable)
}

final class SecondTwoRouter: ViewableRouter<SecondTwoInteractable, SecondTwoViewControllable>, SecondTwoRouting {
    func backToPage() {
        viewController.dismiss(viewController: viewController)
    }
    

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SecondTwoInteractable, viewController: SecondTwoViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
