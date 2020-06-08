//
//  SecondTwoBuilder.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs

protocol SecondTwoDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SecondTwoComponent: Component<SecondTwoDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SecondTwoBuildable: Buildable {
    func build(withListener listener: SecondTwoListener) -> SecondTwoRouting
}

final class SecondTwoBuilder: Builder<SecondTwoDependency>, SecondTwoBuildable {

    override init(dependency: SecondTwoDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SecondTwoListener) -> SecondTwoRouting {
        let component = SecondTwoComponent(dependency: dependency)
        let viewController = SecondTwoViewController()
        let interactor = SecondTwoInteractor(presenter: viewController)
        interactor.listener = listener
        return SecondTwoRouter(interactor: interactor, viewController: viewController)
    }
}
