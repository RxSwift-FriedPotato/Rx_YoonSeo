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
        
        let subject = PublishSubject<String>() //observer
        
        subject.onNext("Hi")
        
        let o1 = subject.subscribe {print (">>1",$0)}
        o1.disposed(by: disposeBag)
//
//        subject.onNext("RxSwift")
//
//        let o2 = subject.subscribe{print(">>2",$0)}
//        o2.disposed(by: disposeBag)
//
//        subject.onNext("Subject")
//        subject.onCompleted()
//
//        let o3 = subject.subscribe{print(">>3",$0)}
//        o3.disposed(by: disposeBag)
        
    }


    func behaviorSubject(){
        print("\n\nBehaviorSubject")
        let disposeBag = DisposeBag()
        
        let subject = BehaviorSubject<String>(value: "start") //observer
        
        subject.onNext("Hi")
        
        let o1 = subject.subscribe {print (">>1",$0)}
        o1.disposed(by: disposeBag)
//
//        subject.onNext("RxSwift")
//
//        let o2 = subject.subscribe{print(">>2",$0)}
//        o2.disposed(by: disposeBag)
//
//        subject.onNext("Subject")
//        subject.onCompleted()
//
//        let o3 = subject.subscribe{print(">>3",$0)}
//        o3.disposed(by: disposeBag)
    }
    
    func replaySubject(){
        print("\n\nReplaySubject")
        let disposeBag = DisposeBag()
        
        let subject = ReplaySubject<String>.create(bufferSize: 2) //observer
        
//        subject.onNext("Hi")
        
        let o1 = subject.subscribe {print (">>1",$0)}
        o1.disposed(by: disposeBag)
//
//        subject.onNext("RxSwift")
//
//        let o2 = subject.subscribe{print(">>2",$0)}
//        o2.disposed(by: disposeBag)
//
//        subject.onNext("Subject")
//        subject.onCompleted()
//
//        let o3 = subject.subscribe{print(">>3",$0)}
//        o3.disposed(by: disposeBag)
    }
    
}

