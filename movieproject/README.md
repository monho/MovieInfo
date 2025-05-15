# 🎬 Flutter 영화 앱 (TMDB 기반)

Flutter로 제작한 아름답고 직관적인 영화 앱입니다.  
[TMDB API](https://developer.themoviedb.org/)를 통해 실시간 영화 데이터를 받아오며, Riverpod 기반 상태관리와 캐싱 처리로 성능도 최적화되어 있습니다.

> 💡 현재 상영작, 인기순, 평점순, 개봉 예정 영화와 상세 페이지까지 모두 포함된 완성형 구조입니다.

---

---

## 🌟 주요 기능

- ✅ 클린 아키텍처 적용 (Domain / Data / Presentation 레이어 분리)
- ✅ Riverpod(AsyncNotifierProvider) 기반 상태관리 + 메모리 캐싱
- ✅ TMDB API 연동 (현재 상영중 / 인기순 / 평점순 / 개봉예정 / 상세정보)
- ✅ 리스트 → 상세 페이지 Hero 애니메이션 전환
- ✅ 가로 스크롤 영화 리스트 UI
- ✅ 로딩 및 에러 처리 UI
- ✅ 이미지 네트워크 캐싱 가능

---

## 🧰 사용 기술

| 구분 | 기술 스택 |
|------|------------|
| UI 프레임워크 | Flutter (Material) |
| 상태관리 | Riverpod v2 (AsyncNotifier) |
| API 통신 | HTTP + TMDB REST API |
| 구조 | 클린 아키텍처 |
| 애니메이션 | Hero, PageRouteBuilder |

---

## 🗂️ 프로젝트 구조

lib/
├── data/
│ ├── datasource/ // TMDB API 호출
│ └── repository/ // 데이터 접근 구현
├── domain/
│ ├── entity/ // 모델 정의
│ └── repository/ // 추상 리포지토리
├── presentation/
│ ├── home/ // 홈 페이지
│ └── detail/ // 상세 페이지
├── core/
│ ├── widgets/ // 공통 위젯
│ └── screet/ // API 키 저장
└── main.dart 

---

