//
//  SecondTwoViewController.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/04.
//  Copyright © 2020 hclim. All rights reserved.
//

import RIBs
import RxSwift
import UIKit
import SnapKit
import RxCocoa

protocol SecondTwoPresentableListener: class {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func backAction()
}

final class SecondTwoViewController: UIViewController, SecondTwoPresentable, SecondTwoViewControllable {
    func dismiss(viewController: ViewControllable) {
        dismiss(animated: true, completion: nil)
    }
    
    
    weak var listener: SecondTwoPresentableListener?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        buildBackButton()
    }
    
    private func buildBackButton() {
        let backButton = UIButton()
        view.addSubview(backButton)
        backButton.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.center.equalTo(self.view.snp.center)
            maker.leading.trailing.equalTo(self.view).inset(40)
            maker.height.equalTo(100)
        }
        backButton.setTitle("Back To Page", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal)
        backButton.backgroundColor = UIColor.black
        backButton.rx.tap
            .subscribe(onNext: { [weak self] in
                print("Tap!!")
                self?.listener?.backAction()
            })
            .disposed(by: disposeBag)
    }
    
}
