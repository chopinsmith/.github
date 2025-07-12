# 🏢 .github 조직 레포지토리

이 레포지토리는 GitHub 조직의 커뮤니티 건강성과 개발자 경험을 향상시키기 위한 템플릿과 설정을 포함합니다.

## 📁 폴더 구조

```
.github/
├── profile/                    # 조직 프로필 페이지
│   └── README.md              # 조직 프로필에 표시되는 내용
├── workflow-templates/         # 워크플로우 템플릿
│   ├── ci.yml                 # CI 워크플로우 템플릿
│   ├── ci.properties.json     # CI 템플릿 메타데이터
│   ├── deploy.yml             # 배포 워크플로우 템플릿
│   └── deploy.properties.json # 배포 템플릿 메타데이터
├── .github/                   # 조직 기본 설정
│   ├── ISSUE_TEMPLATE/        # 이슈 템플릿
│   │   ├── bug_report.yml     # 버그 리포트 템플릿
│   │   └── feature_request.yml # 기능 요청 템플릿
│   ├── workflows/             # 조직 워크플로우
│   │   └── sync-labels.yml    # 라벨 동기화 워크플로우
│   ├── PULL_REQUEST_TEMPLATE.md # PR 템플릿
│   ├── FUNDING.yml            # 후원 설정
│   ├── CODEOWNERS             # 코드 소유자 설정
│   └── labels.yml             # 라벨 설정
├── docs/                      # 문서
│   └── README.md              # 문서 센터
├── scripts/                   # 유틸리티 스크립트
│   └── setup.sh               # 개발 환경 설정 스크립트
├── CONTRIBUTING.md            # 기여 가이드
├── CODE_OF_CONDUCT.md         # 행동 강령
├── SECURITY.md                # 보안 정책
└── README.md                  # 이 파일
```

## 🚀 주요 기능

### 📋 이슈 및 PR 템플릿
- **버그 리포트**: 구조화된 버그 리포팅
- **기능 요청**: 체계적인 기능 제안
- **PR 템플릿**: 일관된 풀 리퀘스트 형식

### 🔄 워크플로우 템플릿
- **CI 워크플로우**: 테스트, 린팅, 빌드 자동화
- **배포 워크플로우**: 프로덕션 배포 자동화
- **라벨 동기화**: 조직 전체 라벨 표준화

### 🏷️ 라벨 관리
- 표준화된 라벨 체계
- 자동 라벨 동기화
- 프로젝트 관리 효율성 향상

### 📚 문서 및 가이드
- 종합적인 기여 가이드
- 보안 정책 및 신고 절차
- 커뮤니티 행동 강령

## 🛠️ 사용법

### 1. 새 레포지토리에서 템플릿 사용

새로운 레포지토리를 생성할 때 이 조직의 템플릿이 자동으로 제공됩니다.

### 2. 기존 레포지토리에 적용

```bash
# 템플릿 복사
cp .github/ISSUE_TEMPLATE/* your-repo/.github/ISSUE_TEMPLATE/
cp .github/PULL_REQUEST_TEMPLATE.md your-repo/.github/
```

### 3. 개발 환경 설정

```bash
# 개발 환경 자동 설정
./scripts/setup.sh
```

## 🎯 각 파일의 역할

### 🏠 프로필 페이지
- `profile/README.md`: 조직 GitHub 페이지에 표시되는 내용

### 🔧 워크플로우 템플릿
- `workflow-templates/`: 다른 레포지토리에서 사용할 수 있는 GitHub Actions 템플릿
- 새 레포지토리 생성 시 "Actions" 탭에서 사용 가능

### 📋 이슈 템플릿
- `ISSUE_TEMPLATE/`: 이슈 생성 시 사용되는 템플릿
- 구조화된 정보 수집으로 이슈 해결 속도 향상

### 🔄 자동화
- `workflows/sync-labels.yml`: 라벨 설정 자동 동기화
- `labels.yml`: 조직 전체 표준 라벨 정의

### 👥 커뮤니티
- `CONTRIBUTING.md`: 기여 방법 및 가이드라인
- `CODE_OF_CONDUCT.md`: 커뮤니티 행동 강령
- `SECURITY.md`: 보안 취약점 신고 절차

## 📈 통계

- 📁 **17개 파일** 생성
- 🏷️ **30+ 표준 라벨** 정의
- 📋 **5개 템플릿** 제공
- 🔄 **3개 워크플로우** 자동화

## 🔗 유용한 링크

- [GitHub 조직 설정 가이드](https://docs.github.com/ko/organizations)
- [커뮤니티 건강성 파일](https://docs.github.com/ko/communities/setting-up-your-project-for-healthy-contributions)
- [워크플로우 템플릿](https://docs.github.com/ko/actions/using-workflows/sharing-workflows-secrets-and-runners-with-your-organization)

## 🤝 기여하기

이 조직 설정의 개선에 기여하고 싶으시다면:

1. [Issues](../../issues)에서 개선 제안
2. [Pull Request](../../pulls)로 직접 기여
3. [Discussions](../../discussions)에서 아이디어 공유

## 📞 문의

- 📧 **이메일**: admin@organization.com
- 💬 **Slack**: #organization-admin
- 🐛 **버그 신고**: [Issues](../../issues/new/choose)

---

**함께 만들어가는 더 나은 개발 환경** 🚀

*마지막 업데이트: 2024년 12월 26일*
