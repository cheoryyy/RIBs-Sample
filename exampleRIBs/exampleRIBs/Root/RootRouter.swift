//
//  RootRouter.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs

protocol RootInteractable: Interactable, FirstPageListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)

}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    // MARK: - Private

    private let firstPageBuilder: FirstPageBuilder
    private var firstPageRouting: ViewableRouting?
    private var firstPage: ViewableRouting?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable, viewController: RootViewControllable,
                  firstPageBuilder: FirstPageBuilder) {
        self.firstPageBuilder = firstPageBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()

    }
    func moveFirstPage() {
        let firstPage = firstPageBuilder.build(withListener: interactor)
        attachChild(firstPage)
        viewController.present(viewController: firstPage.viewControllable)

    }

}
