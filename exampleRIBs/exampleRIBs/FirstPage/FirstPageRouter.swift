//
//  FirstPageRouter.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs

protocol FirstPageInteractable: Interactable, SecondOneListener, SecondTwoListener {
    var router: FirstPageRouting? { get set }
    var listener: FirstPageListener? { get set }
}

protocol FirstPageViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
}

final class FirstPageRouter: ViewableRouter<FirstPageInteractable, FirstPageViewControllable>, FirstPageRouting{
    
    // MARK: - Routing
    func routeSecondOne() {
        let secondOne = secondOneBuilder.build(withListener: interactor )
        attachChild(secondOne)
        viewController.present(viewController: secondOne.viewControllable)
    }
    
    func routeSecondTwo() {
        let secondTwo = secondTwoBuilder.build(withListener: interactor )
        attachChild(secondTwo)
        viewController.present(viewController: secondTwo.viewControllable)
    }
    
    
    // MARK: - Private
    private let secondOneBuilder: SecondOneBuildable
    private let secondTwoBuilder: SecondTwoBuildable

    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: FirstPageInteractable, viewController: FirstPageViewControllable,
                  secondOneBuilder: SecondOneBuildable,
                  secondTwoBuilder: SecondTwoBuildable) {
        self.secondOneBuilder = secondOneBuilder
        self.secondTwoBuilder = secondTwoBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
