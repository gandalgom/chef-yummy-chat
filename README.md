# Yummy Chat

코딩셰프 조금 매운맛 실습 - 채팅 앱

### 주요 실습기능

* Firebase 연동 및 사용법
* Mixins
* Stream / stream builder

### 사용 라이브러리

* [firebase_core](https://pub.dev/packages/firebase_core) 1.18.0
* [firebase_auth](https://pub.dev/packages/firebase_auth) 3.3.20

### 특이사항

* 2022.06 기준 최신 문법 (Flutter 3.0.3)에 맞도록 수정
* 경고 및 중복 코드를 가능하면 줄이는 방향으로 리팩토링

### 작성환경 (2022.06 기준)

* macOS 12.4 Monterey
* Android Studio Chipmunk (2021.2.1, patch 1)
* Flutter 3.0.3

### Git 이용시 장점

git을 이용하여 코드를 내려받을 경우, 주요 업데이트 시점으로 reset 해가면서 진행 상황을 보는 것이 가능  
최초 시작 시점의 경우 별도의 base 브랜치로 분리하여 두었으므로, checkout 하여 거기서부터 작업 가능

```
git checkout base
```

### firebase_auth 설치시 주의점 (ios)

default 상태로 CocoaPod 설치시 오류가 발생.  
ios/Podfile 파일을 열고 주석 처리되어 있는 상단 첫 라인을 확인해서

```
#platform :ios, '9.0'
```

주석을 풀고 이렇게 바꿔줘야 함 (버전은 더 올려도 상관없으나 최소 10.0 이상이어야 함)

```
platform :ios, '10.0'
```
