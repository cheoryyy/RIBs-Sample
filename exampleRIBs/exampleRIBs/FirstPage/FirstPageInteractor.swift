//
//  FirstPageInteractor.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift

protocol FirstPageRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeSecondOne()
    func routeSecondTwo()
}

protocol FirstPagePresentable: Presentable {
    var listener: FirstPagePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol FirstPageListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class FirstPageInteractor: PresentableInteractor<FirstPagePresentable>, FirstPageInteractable, FirstPagePresentableListener {
    func moveToSecondOnePage() {
        router?.routeSecondOne()
    }
    
    func moveToSecondTwoPage() {
        router?.routeSecondTwo()
    }
    

    weak var router: FirstPageRouting?
    weak var listener: FirstPageListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: FirstPagePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
