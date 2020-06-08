//
//  FirstPageBuilder.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift
import Reusable

protocol FirstPageDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.

}

final class FirstPageComponent: Component<FirstPageDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol FirstPageBuildable: Buildable {
    func build(withListener listener: FirstPageListener) -> FirstPageRouting

}

final class FirstPageBuilder: Builder<FirstPageDependency>, FirstPageBuildable {

    override init(dependency: FirstPageDependency) {
        super.init(dependency: dependency)
    }
    func build(withListener listener: FirstPageListener) -> FirstPageRouting {
        let component = FirstPageComponent(dependency: dependency)
        let viewController = FirstPageViewController.instantiate()

        let interactor = FirstPageInteractor(presenter: viewController)
        interactor.listener = listener
        let secondOneBuilder = SecondOneBuilder(dependency: component)
        let secondTwoBuilder = SecondTwoBuilder(dependency: component)
        return FirstPageRouter(interactor: interactor, viewController: viewController, secondOneBuilder: secondOneBuilder, secondTwoBuilder: secondTwoBuilder)
    }

//    func build() -> LaunchRouting {
//        let viewController = FirstPageViewController()
//        let component = FirstPageComponent(dependency: dependency)
//
//        let interactor = FirstPageInteractor(presenter: viewController)
//        let secondOneBuilder = SecondOneBuilder(dependency: component)
//        let secondTwoBuilder = SecondTwoBuilder(dependency: component)
//
//        return FirstPageRouter(interactor: interactor, viewController: viewController, secondOneBuilder: secondOneBuilder, secondTwoBuilder: secondTwoBuilder)
//    }
}
