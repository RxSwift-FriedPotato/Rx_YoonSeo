//
//  ViewModelType.swift
//  MVVM-Practice
//
//  Created by 김윤서 on 2021/05/30.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Dependency
    associatedtype Input
    associatedtype Output

    var dependency: Dependency { get }
    var disposeBag: DisposeBag { get set }
    
    var input: Input { get }
    var output: Output { get }
    
    init(dependency: Dependency)
}
