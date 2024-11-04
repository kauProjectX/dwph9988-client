# 더위피해 9988 - 고령자 온열 질환 예방 서비스

## 프로젝트 구조

```
lib/
├── components/
│   └── gradient_text.dart
├── screens/
│   ├── app_screen.dart
│   ├── card_news_screen.dart 
│   ├── emergency_screen.dart
│   ├── find_idpw_screen.dart
│   ├── guardian/
│   │   └── heat_info_screen.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── point_detail_screen.dart
│   ├── settings_screen.dart
│   └── sign_up_screen.dart
└── main.dart
```

## 초기 설정

### 1. git-lfs 설치 (iOS)

```bash
brew install git-lfs
git lfs install
```

## 주요 기능

- 로그인/회원가입
- 폭염 정보 확인
- 긴급 서비스
- 포인트 적립/사용
- 카드뉴스
- 무더위 쉼터 찾기 (네이버 지도 연동)

## 참고 사항

- iOS 번들 ID: kr.youngminz.dwph9988
- Android 패키지명: kr.youngminz.dwph9988

## 개발 환경

- Flutter
- GetX (상태 관리)
- 네이버 지도 API
