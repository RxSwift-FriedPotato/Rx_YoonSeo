#### 📢 keywords
`asynchronus(비동기)`
`observable(관찰 가능한)`
`functional(함수의)`
`via schedulers(스케줄러를 통해)`

> # 📡 RxSwift
> RxSwift는 '본질적'으로 코드가 '새로운 데이터에 반응'하고 '순차적으로 분리 된' 방식으로 처리함으로써 '비동기식' 프로그램 개발을 간소화합니다.

## 📎 Asynchronus 비동기
- **Asynchronous** 

	사전적으로 "동시에 발생하지 않는" 이라는 의미를 가지고 있습니다.<br>
	즉 iOS에서는 한 가지 일을 처리하는 **동시에 다른 일도 함께 처리**하는 것을 말합니다.

- **iOS 개발 안에서 비동기 프로그래밍이 쓰이는 경우**
		
	- 버튼을 눌렀을 때 이벤트 반응
    	- 텍스트 필드에 포커스가 잡힌 경우
    	- 인터넷에서 크기가 큰 이미지 파일을 받는 경우
    	- 디스크에 데이터를 저장하는 경우
    	- 오디오를 실행하는 경우
        
- **RxSwift 이전 경험했던 비동기 프로그래밍**
	(Apple은 iOS SDK 내에서 비동기식 코드를 작성할 수 있도록 다양한 API를 제공하고 있어요!)
		
	- NotificationCenter
        - Delegate 패턴
        - Closures
        - Grand Central Dispath(GCD)
  		
일반적으로 대부분의 클래스들은 비동기적으로 작업을 수행하고 모든 UI 구성 요소들은 본질적으로 비동기적으로 동작합니다.<br>
따라서 내가 어떤 앱 코드를 작성했을 때 정확히 매번 어떤 순서로 작동하는 지 가정하는 것은 불가능하겠죠!<br>
결국!✨ 앱의 코드는 사용자 입력, 네트워크 활동 또는 기타 OS 이벤트와 같은 다양한 외부 요인에 따라 완전히 다른 순서로 실행될 수 있습니다.<br>
> **Apple의 SDK내의 API를 통한 복합적인 비동기 코드는 부분별로 나눠서 쓰기 매우 어려울 수 밖에 없고 추적 불가합니다.** 

### RxSwift의 필요성

1. 앱의 state를 관리하는 것
2. (부수 작용)이슈를 추적 가능하게 해줍니다.
3. 명령형 프로그래밍을 도와줍니다.
	- 하지만 인간이 일일이 명령하기에는 한계가 있음 & 인간은 실수를 할 수 있겠죠!
4. 명령형 프로그래밍에서의 상태변화는 자유자재로 가능하게 해줍니다.
	- 함수형 코드에서는 부수작용을 일으킬 수 없습니다.
	- RxSwift = 명령형 프로그래밍 + 함수형 프로그래밍 (자유로운 상태변화 + 추적 가능한 결과값)
	- 변경 불가능 한 데이터로 작업하고 순차적이고 결과론적인 방식으로 코드 실행이 가능합니다.
     
## 📎 RxSwift의 구성 요소

### ✔️ Observables (생산자)
- 다른 클래스에서 만든 값을 시간에 따라 읽을 수 있도록 해줍니다.
- 하나 이상의 observers(관찰자)가 실시간으로 어떤 이벤트에 반응하고 앱 UI를 업데이트 하거나 생성하는 지를 처리하고 활용할 수 있게 해줍니다.
- observer가 observable을 구독하는 형태로 이루어져있습니다.

옵저버는 `Subscribe`메서드를 통해서 `Observable`을 구독하고 `onNext`, `onError`, `onCompleted`라는 메소드를 구현하게 됩니다.

> - `onNext` : `Observable`이 배출하는 값을 파라미터로 전달받는다. (`next`를 전달 받음)
> - `onError` : `Observable`이 원하던 값이 아니거나 오류가 발생하면 이 메서드를 호출하고 오류 정보 객체를 파라미터로 전달받고 `onNext`나 `onCompleted`메서드는 호출되지 않는다.(`error`를 전달 받음)
> - `onCompleted` : `Observable`은 제일 마지막에 이 메소드를 호출한다.(`completed`를 전달 받음)

**📢 Subscribe가 호출되기 전까지 Observable은 선언만 된 상태이기 때문에 어떠한 event도 일어나지 않아요!**<br>
즉, subscribe가 호출되어야만 observable이 생성되는 것! <br>
subscribe는 Observable의 stream을 구독(관찰) 하는 역할을 합니다.<br>



#### 🛠Observable sequence
1) **Finite observable sequences**
: 값을 방출한 뒤, 성공 or 에러를 통해 종료된다.
2) **Infinite observable sequences**
: 무한한 sequence, 무한 하게 관찰 가능한 sequence (보통 UI 이벤트)


### ✔️ Operators (연산자)
- 비동기 입력을 받아 부수작용 없이 return만 생성하므로 퍼즐 조각마냥 쉽게 결합이 가능하게 해줍니다.
- Observable 상에서 동작하고 Observable을 리턴하며 연산자들을 연속적으로 호출 가능한 연산자 체인을 제공합니다.
- 연산자들이 연속으로 있는 경우 호출 순서에 따라 실행결과 값이 달라질 수 있습니다.

#### 🛠 Observable 생성
새로운 Observable을 생성하는 연산자

> - `Just` : 객체 하나 또는 객체 집합을 Observable로 변환
> - `Of` : 가변할 수 있는 개수 만큼의 요소를 Observable로 변환 
> - `From` : 다른 객체나 자료구조(예: 배열) 를 Observable로 변환

#### 🛠 Observable 변환
Observable이 반환하는 데이터를 변환하는 연산자

> - `Map` : Observable이 반환하는 데이터에 함수를 적용

#### 🛠 Observable 필터링
Observable에서 선택적으로 데이터를 반환하는 연산자

> - `Filter` : 조건을 만족하는 데이터를 반환
> - `First` : 맨 첫 번째나 조건을 만족하는 첫 번째 데이터만 반환
> - `Take` : 함수 파라미터로 정수 값을 전달 받으며 해당 숫자 만큼의 데이터 반환
> - `DistinctUntilChanged` : 이전에 방출한 요소값과 현재의 요소가 다른 경우에만 데이터 반환

#### 🛠 Observable 결합
여러 개의 Observable들을 하나로 결합하는 연산자

> - `Merge` : 다수의 Observable들이 반환하는 데이터를 합쳐 하나로 만듬

#### 🛠 오류 처리
> - `Catch` : 오류를 무시하고 반환되는 데이터를 진행해 onError로부터의 오류를 복구
> - `Retry` : onError가 발생할 경우 오류없이 동작하기를 기대하면서 다시 진행

#### 🛠 Observable 유틸리티
Observable과 함께 동작하는 연산자

> - `Do` : Observable의 생명주기에서 발생하는 여러 이벤트에서 실행될 액션을 등록
> - `ObserveOn` : 옵저버가 어느 스케줄러 상에서 Observable을 관찰할지 명시
> - `Subscribe` : Observable이 반환하는 데이터와 알림을 기반으로 동작
> - `SubscribeOn` : Observable을 구독할 때 사용할 스케줄러를 명시

### ✔️ Schedulers
dispatch queue와 동일하지만 RxSwift에서는 여러가지의 스케줄러가 이미 정의되어 있으며 대부분의 상황에서 사용 가능 하므로 개발자가 자신만의 스케쥴러를 생성할 일은 없을 것입니다.

`ObserveOn`과 `SubscribeOn`이 Schedulers로 작동되는 대표적인 두 연산자인데요!

> - `SubscribeOn` : 시작할 스케쥴러를 결정
> - `ObserveOn` : 어느 스케줄러에서 observe할 것인지 결정

#### ✨observeOn subscribeOn 차이
observeOn은 Observable이 아이템을 전파할 때 사용할 스레드를 지정하고
subscribeOn은 구독(subscribe)에서 사용할 스레드를 지정합니다.

#### 🛠 Schedulers의 종류
#### 📓 Serial vs Concurrent 
> 직렬큐 : 분산 처리 시킨 작업을 다른 **한 개**의 쓰레드에서 처리하는 큐 <br>
> 동시큐 : 분산 처리 시킨 작업을 다른 **여러개의** 쓰레드에서 처리하는 큐

but, 여러 개의 직렬큐를 만들어 처리한 다면 각각의 직렬 큐 별로 하나의 쓰레드에 작업을 할당하지만 각각의 큐는 동시(Concurrent)에 동작합니다.

1) **Main** (Serial)
- 메인 쓰레드에서 가장 최상단에 존재
- UI를 갱신하려면 이 스케줄러를 이용해야함
- MainSchedule.asyncInstance는 자주 쓰이지 않고, 가능하면 쓰는걸 회피하는 것이 좋음

2) **SerialDispatchQueue** (Serial)
- background에서 추출하는 일을 처리할 때 사용

3) **CurrentThread** (Serial)
- 현재 있는 쓰레드에서 작업이 실행됨
- 이미 실행 중이라면 예정되어 있던 액션은 저장되고 현재 실행 중인 액션과 모든 전에 저장되었던 액션이 실행 종료되고나서야 실행됨

4) **ConcurrentDispatchQueue** (Concurrent)
- SerialDispatchQueue처럼 추출하는 일을 할 때 사용, 단 병렬적! 

5) **OperationQueue** (Concurrent)
- NSOperationQueue에서 실행되어야 할 작업을 처리함

6) **Test**
- 단지 테스트를 위한 것이며  production code에는 사용하지 않음
- RxTest 라이브러리에 존재

### ✨ Disposable과 DisposableBag
Observable의 subscribe들은 모두 Disposable 를 반환합니다.
subscribe()의 리턴타입인 Disposable에서 disposed(by:)메소드를 호출하면 사용할 수 있습니다!

구독을 dispose하기 위해 사용하거나 실행 취소를 위해 dispose를 사용합니다.

1) Disposables
2) BooleanDisposable
3) CompositeDisposable

Subscription마다 각각 dipose를 관리하는 것은 리스크가 있기에 DiposeBag을 지원합니다!
DisposableBag에 담긴 Disposable은 DisposableBag이 해제되는 시점에 모두 함께 해제되어집니다.



        
     
