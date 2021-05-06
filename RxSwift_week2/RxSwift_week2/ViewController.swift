//
//  ViewController.swift
//  RxSwift_week2
//
//  Created by 김윤서 on 2021/04/28.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        publishSubject()
        behaviorSubject()
        replaySubject()
    }
    
    func publishSubject(){
        print("\n\nPublishSubject")
        let disposeBag = DisposeBag()
        let subject = PublishSubject<String>()
        
        subject.onNext("Hi")
        
        let o1 = subject.subscribe {print (">>1",$0)}
        o1.disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")

        let o2 = subject.subscribe{print(">>2",$0)}
        o2.disposed(by: disposeBag)
        
        subject.onNext("c")
        subject.onNext("d")
        
    }


    func behaviorSubject(){
        print("\n\nBehaviorSubject")
        let disposeBag = DisposeBag()
        
        let subject = BehaviorSubject<String>(value: "start") //observer
        
        subject.onNext("Hi 1")
        subject.onNext("Hi 2")
        subject.onNext("Hi 3")
        subject.onNext("Hi 4")
        
        let o1 = subject.subscribe {print (">>1",$0)}
        o1.disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")

        let o2 = subject.subscribe{print(">>2",$0)}
        o2.disposed(by: disposeBag)
        
        subject.onNext("c")
        subject.onNext("d")
    }
    
    func replaySubject(){
        print("\n\nReplaySubject")
        let disposeBag = DisposeBag()
        
        let subject = ReplaySubject<String>.create(bufferSize: 1) //observer
        
        subject.onNext("Hi 1")
        subject.onNext("Hi 2")
        subject.onNext("Hi 3")
        subject.onNext("Hi 4")
        
        let o1 = subject.subscribe {print (">>1",$0)}
        o1.disposed(by: disposeBag)
        
        subject.onNext("a")
        subject.onNext("b")

        let o2 = subject.subscribe{print(">>2",$0)}
        o2.disposed(by: disposeBag)
        
        subject.onNext("c")
        subject.onNext("d")
    }
    
}

