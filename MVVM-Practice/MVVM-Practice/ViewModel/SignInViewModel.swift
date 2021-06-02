//
//  SignInViewModel.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/06/02.
//

import RxCocoa
import RxSwift

final class SignUpViewModel: ViewModelType{
    var dependency: Dependency
    var disposeBag: DisposeBag = DisposeBag()
    var input: Input
    var output: Output
    
    private let idText$: BehaviorSubject<String?>
    private let passwordText$: BehaviorSubject<String?>
    private let checkText$: BehaviorSubject<String?>
    
    struct Dependency {
        var id: String?
        var password: String?
        var check: String?
    }
    
    struct Input {
        var idText : AnyObserver<String?>
        var passwordText : AnyObserver<String?>
        var checkText : AnyObserver<String?>
    }
    
    struct Output {
        var signUpEnabled: Driver<Bool>
    }
    
    init(dependency: Dependency = Dependency(id: nil, password: nil, check: nil)) {
        self.dependency = dependency
        
        let idText$ = BehaviorSubject<String?>(value: nil)
        let passwordText$ = BehaviorSubject<String?>(value: nil)
        let checkText$ = BehaviorSubject<String?>(value: nil)
        
        let signUpEnabled$ = Observable.combineLatest(idText$,passwordText$,checkText$)
            .map(signUpValidation)
            .asDriver(onErrorJustReturn: false)
        
        self.input = Input(idText: idText$.asObserver(), passwordText: passwordText$.asObserver(), checkText: checkText$.asObserver())
        
        self.output = Output(signUpEnabled: signUpEnabled$)
        
        self.idText$ = idText$
        self.passwordText$ = passwordText$
        self.checkText$ = checkText$
    }
  
}

private func signUpValidation(id: String?, password: String?,check: String?) -> Bool {
    print("----signUpValidation----")
   
    return id?.isEmpty == false && password?.isEmpty == false && check?.isEmpty == false
}
