# Yummy Chat

코딩셰프 조금 매운맛 실습 - 채팅 앱

### 주요 실습기능

* Firebase 연동 및 사용법
* Mixins
* Stream / stream builder

### 사용 라이브러리

* [firebase_core](https://pub.dev/packages/firebase_core) 1.18.0
* [firebase_auth](https://pub.dev/packages/firebase_auth) 3.3.20
* [cloud_firestore](https://pub.dev/packages/cloud_firestore) 3.1.18
* [modal_progress_hud_nsn](https://pub.dev/packages/modal_progress_hud_nsn) 0.2.1

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

### cloud_firestore 설치시 주의점 (android)

cloud_firestore 라이브러리의 android minSDK는 19이고, flutter의 android minSDK는 16으로 설치 오류 발생.  
그러나 설치만을 위해 android minSDK를 기계적으로 19까지만 올릴 경우 **DexArchiveMergerException**을 보시게 됨.  
오류가 아닌 안드로이드 아키텍처의 한계로 발생한 문제임. 자세히 알고 싶으신 분은 [링크 참조](https://developer.android.com/studio/build/multidex?hl=ko)

이 내용은 **minSDK를 21 이상**으로 하면 별도 옵션없이 처리 가능함. (Android 5.0 부터 앱을 돌아가게 하겠다는 얘기. 언제적 폰임)  
2022년 6월 현재 23(Android 6.0. 점유율 95% 이상)으로도 가능. <u>앱 보안 안정성이 강화된 23 쪽을 추천</u>.

android/app/build.gradle 파일을 열고 중간의 minSdkVersion 옆의 **flutter.minSdkVersion**텍스트를 지우고 바꿈

```
android {
    defaultConfig {
        ...
        minSdkVersion 23
        ...
    }
    ...
}
```

Flutter android midSDK version이 (구글이 계획적으로 그런거긴 하지만) 좀 심각하게 낮음.
