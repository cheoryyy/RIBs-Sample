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
        testLabel.text = "changed!! 길게 글을 써보자요 !!!!!!\n 개행 개행 개행 ~)"
        
        
        print("testLabel size(changed) : \(self.testLabel.frame.size)")
        print("testLabel Intrinsic size(changed) : \(self.testLabel.intrinsicContentSize)")
        
        self.view.layoutIfNeeded() // 됨
        print("view.layoutIfNeeded")

        print("testLabel size(changed) layoutIfNeeded: \(self.testLabel.frame.size)")
        print("testLabel Intrinsic size(changed) layoutIfNeeded: \(self.testLabel.intrinsicContentSize)")

    }
    
    
    
    
    
    
    
    
    
    func originLabel() {
        testLabel.text = "Intrinsic Size"
        
        
        print("testLabel size : \(self.testLabel.frame.size)")
        print("testLabel Intrinsic size : \(self.testLabel.intrinsicContentSize)")

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
//                self?.listener?.moveToSecondTwoPage()
                self?.changeLabel()
            })
            .disposed(by: disposeBag)

        secondOneButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("Tap!!")
//                self?.listener?.moveToSecondOnePage()
                self?.originLabel()
            })
            .disposed(by: disposeBag)

    }

    // MARK: - Controllable

    func present(viewController: ViewControllable) {
        present(viewController.uiviewController, animated: true, completion: nil)
    }

}
