//
//  AppComponent.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import Foundation
import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}
