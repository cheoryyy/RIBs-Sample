//
//  SecondOneInteractor.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift

protocol SecondOneRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SecondOnePresentable: Presentable {
    var listener: SecondOnePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SecondOneListener: class {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func tossToFirstPage()
}

final class SecondOneInteractor: PresentableInteractor<SecondOnePresentable>, SecondOneInteractable, SecondOnePresentableListener {
    func changeLabel() {
        listener?.tossToFirstPage()
    }
    

    weak var router: SecondOneRouting?
    weak var listener: SecondOneListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SecondOnePresentable) {
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
