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

class HogeViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private var viewModel: HogeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = HogeViewModel()
        
        viewModel.hellowWorldObservable.subscribe(onNext: { [weak self] value in
            print("value: \(value)")
        })
            .disposed(by: disposeBag)
        viewModel.updateItem()
    }
}

class HogeViewModel {
    var hellowWorldObservable: Observable<String> {
        return helloWorldSubject.asObservable()
    }
    
    private let helloWorldSubject = PublishSubject<String>()
    
    
    func updateItem() {
        helloWorldSubject.onNext("Hello World!")
        helloWorldSubject.onNext("Hello World!!")
        helloWorldSubject.onNext("Hello World!!!")
        helloWorldSubject.onCompleted()
    }
}

