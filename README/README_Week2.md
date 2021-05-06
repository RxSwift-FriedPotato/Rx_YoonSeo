## 🧾Subject란?
observable은  unicast 방식
subject는 multicast 방식으로 여러개의 observer를 subscribe할 수 있습니다.

## Subject의 종류
### Publish Subject
구독한 뒤에 Observable이 보낸 이벤트를 전달받습니다. <br>
element 없이 빈 상태로 생성되고, subscribe한 시점 이후에 발생되는 이벤트만 전달받아요.<br>

```swift
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
```

출력 결과는?
```swift
>>1 next(a)
>>1 next(b)
>>1 next(c)
>>2 next(c)
>>1 next(d)
>>2 next(d)
```

o1의 구독 시점 이전에 발생한 이벤트인 Hi와 <br>
o2의 구독 시점 이전에 발생한 이벤트인 Hi,a,b에 대해서는 전달되지 않는 모습을 볼 수 있어요! <br>

### Behavior Subject
구독 후에 발생한 시점 이전에 발생한 이벤트 중 가장 최신의 이벤트를 전달받습니다. <br>
초기값을 가지고 생성된다는 점이 Behavior Subject 만의 특징이에요! 

```swift
let disposeBag = DisposeBag()
let subject = BehaviorSubject<String>(value: "start") //observer

subject.onNext("Hi")

let o1 = subject.subscribe {print (">>1",$0)}
o1.disposed(by: disposeBag)

subject.onNext("a")
subject.onNext("b")

let o2 = subject.subscribe{print(">>2",$0)}
o2.disposed(by: disposeBag)

subject.onNext("c")
subject.onNext("d")
```

출력 결과는?
```swift
>>1 next(Hi)
>>1 next(a)
>>1 next(b)
>>2 next(b)
>>1 next(c)
>>2 next(c)
>>1 next(d)
>>2 next(d)
```

o1 기준 가장 최신의 이벤트인 Hi와 <br>
o2 기준 가장 최신의 이벤트인 b가 전달되어 나오는 모습을 볼 수 있어요 <br>

### Replay Subject
구독 전에 발생한 이벤트를 버퍼에 넣고, 버퍼에 들어있는 이벤트를 전달해요. <br>
미리 사이즈를 정해줘야하고, 버퍼 사이즈 만큼의 최신 이벤트를 전달받아요! <br>
```swift
let disposeBag = DisposeBag()        
let subject = ReplaySubject<String>.create(bufferSize: 4) //observer

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
        
 ```
 
출력 결과는?
```swift
>>1 next(Hi 1)
>>1 next(Hi 2)
>>1 next(Hi 3)
>>2 next(Hi 3)
>>1 next(Hi 4)
>>2 next(Hi 4)
>>1 next(a)
>>2 next(a)
>>1 next(b)
>>2 next(b)
>>1 next(c)
>>2 next(c)
>>1 next(d)
>>2 next(d)
```

### Async Subject
다른 subject와 달리 이벤트를 전달하는 시점이 달라요!<br>
completed 이벤트가 전달되기 전까진 어떠한 이벤트도 전달하지 않아요. <br>
반면 위에서 살펴본 Subject들은 바로 전달이 되었죠!<br>
completed되면 그 시점에서 가장 최근 이벤트 하나만 next로 전달합니다!

```swift
let asubject = AsyncSubject<Int>()
asubject.onNext(1)
asubject.onNext(2)
asubject.onNext(3)
asubject.onCompleted()
aSubject.subscribe({event in
                    print(event)

})
asubject.onNext(4)
asubject.onNext(5)
```
