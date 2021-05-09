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

종류가 넘 많고 하나하나 다 알 수가 없어서... 공식 홈페이지 + 구글링을 해보는 것이 빠를 것 같다..
