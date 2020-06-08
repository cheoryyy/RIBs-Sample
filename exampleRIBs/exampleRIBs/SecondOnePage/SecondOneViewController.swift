//
//  SecondOneViewController.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Reusable

protocol SecondOnePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SecondOneViewController: UIViewController, StoryboardBased, SecondOnePresentable, SecondOneViewControllable {

    weak var listener: SecondOnePresentableListener?
}
