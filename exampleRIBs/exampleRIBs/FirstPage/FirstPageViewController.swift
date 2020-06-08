//
//  FirstPageViewController.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import Reusable

protocol FirstPagePresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func moveToSecondOnePage()
    func moveToSecondTwoPage()
}

final class FirstPageViewController: UIViewController, StoryboardBased, FirstPagePresentable, FirstPageViewControllable {
    func changeLabel() {
        testLabel.text = "changed!!\n\(DateInterval.init().description)"
    }
    

    @IBOutlet weak var secondTwoButton: UIButton!
    
    @IBOutlet weak var secondOneButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!

    private let disposeBag = DisposeBag()

    weak var listener: FirstPagePresentableListener?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondTwoButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("Tap!!")
                self?.listener?.moveToSecondTwoPage()
            })
            .disposed(by: disposeBag)

        secondOneButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("Tap!!")
                self?.listener?.moveToSecondOnePage()
            })
            .disposed(by: disposeBag)

    }

    // MARK: - Controllable

    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }

}
