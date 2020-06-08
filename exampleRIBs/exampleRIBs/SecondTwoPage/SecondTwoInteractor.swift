//
//  SecondTwoInteractor.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift

protocol SecondTwoRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func backToPage()
}

protocol SecondTwoPresentable: Presentable {
    var listener: SecondTwoPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SecondTwoListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SecondTwoInteractor: PresentableInteractor<SecondTwoPresentable>, SecondTwoInteractable, SecondTwoPresentableListener {
    func backAction() {
        router?.backToPage()
    }
    

    weak var router: SecondTwoRouting?
    weak var listener: SecondTwoListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SecondTwoPresentable) {
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
