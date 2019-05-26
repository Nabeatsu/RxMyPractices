//
//  ViewController.swift
//  RxPractices
//
//  Created by 田辺信之 on 2019/05/27.
//  Copyright © 2019 田辺信之. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let helloWorldSubject = PublishSubject<String>()
        helloWorldSubject
            .subscribe(onNext: { message in
                print("onNext: \(message)")
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()
    }
}

