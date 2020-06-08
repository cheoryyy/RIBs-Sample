//
//  FirstPageDependencySecondOne.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import Foundation
import RIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedIn scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol FirstPageDependencySecondOne: Dependency {

    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedIn scope.
}

extension FirstPageComponent: SecondOneDependency {

}
