# 🤝 기여 가이드

조직의 프로젝트에 기여해주셔서 감사합니다! 이 문서는 기여하는 방법을 안내합니다.

## 🌟 기여 방법

### 1. 🐛 버그 리포트
- [버그 리포트 템플릿](../../issues/new?template=bug_report.yml)을 사용해주세요
- 재현 가능한 단계를 포함해주세요
- 환경 정보(브라우저, OS 등)를 명시해주세요

### 2. 🚀 기능 제안
- [기능 요청 템플릿](../../issues/new?template=feature_request.yml)을 사용해주세요
- 왜 필요한지 명확히 설명해주세요
- 가능하다면 목업이나 스크린샷을 포함해주세요

### 3. 📝 코드 기여
1. 저장소를 Fork 하세요
2. 새로운 브랜치를 생성하세요 (`git checkout -b feature/amazing-feature`)
3. 변경사항을 커밋하세요 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 푸시하세요 (`git push origin feature/amazing-feature`)
5. Pull Request를 생성하세요

## 📋 코딩 스타일 가이드

### JavaScript/TypeScript
```javascript
// 좋은 예
const getUserData = async (userId) => {
  try {
    const response = await api.get(`/users/${userId}`);
    return response.data;
  } catch (error) {
    console.error('Error fetching user:', error);
    throw error;
  }
};
```

### CSS
```css
/* 좋은 예 */
.component-name {
  display: flex;
  align-items: center;
  padding: 1rem;
  border-radius: 0.5rem;
}

.component-name__element {
  font-size: 1.2rem;
  color: var(--primary-color);
}
```

## 🧪 테스트 가이드

### 단위 테스트
```javascript
// 테스트 예시
describe('getUserData', () => {
  it('should return user data when user exists', async () => {
    const mockUser = { id: 1, name: 'Test User' };
    jest.spyOn(api, 'get').mockResolvedValue({ data: mockUser });
    
    const result = await getUserData(1);
    
    expect(result).toEqual(mockUser);
    expect(api.get).toHaveBeenCalledWith('/users/1');
  });
});
```

### 테스트 실행
```bash
# 모든 테스트 실행
npm test

# 특정 파일 테스트
npm test -- --testNamePattern="getUserData"

# 커버리지 확인
npm run test:coverage
```

## 📖 문서 가이드

### README 작성
- 프로젝트 설명을 명확히 작성
- 설치 및 사용법 포함
- 예시 코드 제공
- 기여 방법 안내

### 코드 주석
```javascript
/**
 * 사용자 데이터를 가져오는 함수
 * @param {number} userId - 사용자 ID
 * @returns {Promise<Object>} 사용자 데이터
 * @throws {Error} API 호출 실패 시
 */
const getUserData = async (userId) => {
  // 구현 코드
};
```

## 🔍 코드 리뷰 가이드

### 리뷰어를 위한 가이드
- 코드의 명확성과 가독성 확인
- 성능 및 보안 이슈 점검
- 테스트 커버리지 확인
- 문서 업데이트 여부 확인

### 기여자를 위한 가이드
- 작고 집중된 PR 생성
- 명확한 커밋 메시지 작성
- 테스트 추가/업데이트
- 코드 리뷰 피드백에 적극적으로 응답

## 🏷️ 커밋 메시지 규칙

### 형식
```
[타입] 제목 (50자 이내)

본문 (선택사항)
- 변경사항 설명
- 변경 이유
- 구현 방법
```

### 타입
- `feat`: 새로운 기능
- `fix`: 버그 수정
- `docs`: 문서 수정
- `style`: 코드 스타일 변경
- `refactor`: 코드 리팩토링
- `perf`: 성능 개선
- `test`: 테스트 추가/수정
- `chore`: 기타 작업

## 🌱 첫 기여자를 위한 가이드

### 시작하기
1. [Good First Issue](../../issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22) 라벨을 찾아보세요
2. 관심 있는 이슈에 댓글을 달아 작업 의사를 표현하세요
3. 궁금한 점이 있으면 언제든 질문하세요

### 도움받기
- 💬 [Discussions](../../discussions)에서 질문하세요
- 📧 이메일: contribute@organization.com
- 💬 Discord: [초대 링크](https://discord.gg/organization)

## 🎯 기여자 인정

### 기여자 목록
모든 기여자는 README에서 인정받습니다:
- 코드 기여
- 문서 개선
- 버그 리포트
- 아이디어 제안

### 기여 배지
- 첫 기여: 🌟 First Contributor
- 정기 기여: 🔥 Regular Contributor
- 메인테이너: 👑 Maintainer

## 📜 라이선스

이 프로젝트에 기여함으로써 귀하는 기여 내용이 프로젝트와 동일한 라이선스 하에 라이선스됨에 동의합니다.

---

질문이 있으시면 언제든 연락주세요! 함께 더 나은 프로젝트를 만들어가요 🚀 