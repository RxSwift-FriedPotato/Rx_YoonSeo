//
//  ViewModel.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import Foundation
import RxSwift
import RxCocoa

final class ViewModel : ViewModelType{
    struct Dependency {
        var id: String?
        var password: String?
    }
    
    struct Input {
        var idText : AnyObserver<String?>
        var passwordText : AnyObserver<String?>
    }
    
    struct Output {
        var signUpEnabled: Driver<Bool>
        var signInEnabled: Driver<Bool>
    }
    
    let dependency: Dependency
    
    var disposeBag: DisposeBag = DisposeBag()
    
    let input: Input
    
    let output: Output
    
    private let idText$: BehaviorSubject<String?>
    private let passwordText$: BehaviorSubject<String?>
    
    init(dependency: Dependency = Dependency(id: nil, password: nil)) {
        self.dependency = dependency
        
        let idText$ = BehaviorSubject<String?>(value: nil)
        let passwordText$ = BehaviorSubject<String?>(value: nil)
        
        let signUpEnabled$ = Observable.combineLatest(idText$,passwordText$)
            .map(signUpVaildation)
            .asDriver(onErrorJustReturn: false)
        
        let signInEnabled$ = Observable.combineLatest(idText$,passwordText$)
            .map(signInValidation)
            .asDriver(onErrorJustReturn: false)
        
        self.input = Input(idText: idText$.asObserver(), passwordText: passwordText$.asObserver())
        
        self.output = Output(signUpEnabled: signUpEnabled$, signInEnabled: signInEnabled$)
        
        self.idText$ = idText$
        self.passwordText$ = passwordText$

    }
    
}

private func signInValidation(id: String?, password: String?) -> Bool {
    print("----signInValidation----")
   
    return id?.isEmpty == false && password?.isEmpty == false
}

private func signUpVaildation(id: String?, password: String?) -> Bool {
    print("----signUpValidation----")
    print(id?.isEmpty == true && password?.isEmpty == true)
    return id?.isEmpty == true && password?.isEmpty == true
}


