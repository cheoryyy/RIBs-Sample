//
//  SecondOneBuilder.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import Reusable

protocol SecondOneDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SecondOneComponent: Component<SecondOneDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SecondOneBuildable: Buildable {
    func build(withListener listener: SecondOneListener) -> SecondOneRouting
}

final class SecondOneBuilder: Builder<SecondOneDependency>, SecondOneBuildable {

    override init(dependency: SecondOneDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SecondOneListener) -> SecondOneRouting {
        let component = SecondOneComponent(dependency: dependency)
        let viewController = SecondOneViewController.instantiate()
        let interactor = SecondOneInteractor(presenter: viewController)
        interactor.listener = listener
        return SecondOneRouter(interactor: interactor, viewController: viewController)
    }
}
