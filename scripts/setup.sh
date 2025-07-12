#!/bin/bash

# 🚀 개발 환경 설정 스크립트
# 이 스크립트는 조직의 개발 환경을 자동으로 설정합니다.

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 로깅 함수
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 헤더 출력
print_header() {
    echo -e "${GREEN}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🚀 조직 개발 환경 설정 스크립트"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${NC}"
}

# 시스템 정보 확인
check_system() {
    log_info "시스템 정보 확인 중..."
    
    OS=$(uname -s)
    ARCH=$(uname -m)
    
    log_info "운영체제: $OS"
    log_info "아키텍처: $ARCH"
    
    case $OS in
        "Darwin")
            PLATFORM="macOS"
            ;;
        "Linux")
            PLATFORM="Linux"
            ;;
        *)
            log_error "지원하지 않는 운영체제입니다: $OS"
            exit 1
            ;;
    esac
    
    log_success "시스템 정보 확인 완료"
}

# 필수 도구 확인
check_prerequisites() {
    log_info "필수 도구 확인 중..."
    
    REQUIRED_TOOLS=("git" "curl" "node" "npm")
    MISSING_TOOLS=()
    
    for tool in "${REQUIRED_TOOLS[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            MISSING_TOOLS+=("$tool")
        fi
    done
    
    if [ ${#MISSING_TOOLS[@]} -ne 0 ]; then
        log_error "다음 도구들이 설치되어 있지 않습니다:"
        for tool in "${MISSING_TOOLS[@]}"; do
            echo "  - $tool"
        done
        log_info "설치 후 다시 실행해주세요."
        exit 1
    fi
    
    log_success "필수 도구 확인 완료"
}

# Node.js 버전 확인
check_node_version() {
    log_info "Node.js 버전 확인 중..."
    
    NODE_VERSION=$(node -v | cut -d 'v' -f 2)
    MIN_NODE_VERSION="16.0.0"
    
    if [ "$(printf '%s\n' "$MIN_NODE_VERSION" "$NODE_VERSION" | sort -V | head -n1)" != "$MIN_NODE_VERSION" ]; then
        log_error "Node.js 버전이 너무 낮습니다. 최소 v$MIN_NODE_VERSION이 필요합니다."
        log_info "현재 버전: v$NODE_VERSION"
        exit 1
    fi
    
    log_success "Node.js 버전 확인 완료 (v$NODE_VERSION)"
}

# Git 설정
setup_git() {
    log_info "Git 설정 중..."
    
    # Git 사용자 정보 확인
    if ! git config user.name &> /dev/null; then
        read -p "Git 사용자 이름을 입력하세요: " git_name
        git config --global user.name "$git_name"
    fi
    
    if ! git config user.email &> /dev/null; then
        read -p "Git 이메일을 입력하세요: " git_email
        git config --global user.email "$git_email"
    fi
    
    # Git 기본 설정
    git config --global init.defaultBranch main
    git config --global pull.rebase true
    git config --global core.autocrlf input
    
    log_success "Git 설정 완료"
}

# 개발 도구 설치
install_dev_tools() {
    log_info "개발 도구 설치 중..."
    
    # 전역 npm 패키지 설치
    GLOBAL_PACKAGES=(
        "@commitlint/cli"
        "@commitlint/config-conventional"
        "husky"
        "lint-staged"
        "prettier"
        "eslint"
        "@typescript-eslint/parser"
        "@typescript-eslint/eslint-plugin"
    )
    
    for package in "${GLOBAL_PACKAGES[@]}"; do
        log_info "설치 중: $package"
        npm install -g "$package"
    done
    
    # 플랫폼별 도구 설치
    case $PLATFORM in
        "macOS")
            install_macos_tools
            ;;
        "Linux")
            install_linux_tools
            ;;
    esac
    
    log_success "개발 도구 설치 완료"
}

# macOS 도구 설치
install_macos_tools() {
    log_info "macOS 전용 도구 설치 중..."
    
    # Homebrew 확인
    if ! command -v brew &> /dev/null; then
        log_info "Homebrew 설치 중..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    
    # 유용한 도구들 설치
    brew install git-flow
    brew install gh
    brew install tree
    
    log_success "macOS 도구 설치 완료"
}

# Linux 도구 설치
install_linux_tools() {
    log_info "Linux 전용 도구 설치 중..."
    
    # 패키지 매니저 확인
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y git-flow tree
    elif command -v yum &> /dev/null; then
        sudo yum install -y git-flow tree
    fi
    
    # GitHub CLI 설치
    if ! command -v gh &> /dev/null; then
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
        sudo apt update
        sudo apt install gh
    fi
    
    log_success "Linux 도구 설치 완료"
}

# 프로젝트 템플릿 설정
setup_project_templates() {
    log_info "프로젝트 템플릿 설정 중..."
    
    # 글로벌 Git 훅 디렉토리 생성
    mkdir -p ~/.git-templates/hooks
    
    # 커밋 메시지 템플릿 생성
    cat > ~/.git-templates/commit-template << 'EOF'
[타입] 제목 (50자 이내)

본문 (선택사항)

1. 첫 번째 변경사항
2. 두 번째 변경사항
3. 세 번째 변경사항

변경 이유:
- 왜 이 변경이 필요했는지

구현 방법:
- 어떻게 구현했는지
EOF
    
    # Git 전역 설정에 템플릿 경로 추가
    git config --global commit.template ~/.git-templates/commit-template
    git config --global init.templatedir ~/.git-templates
    
    log_success "프로젝트 템플릿 설정 완료"
}

# 개발 환경 확인
verify_setup() {
    log_info "개발 환경 확인 중..."
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🔍 설치된 도구 버전"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    echo "Node.js: $(node -v)"
    echo "npm: $(npm -v)"
    echo "Git: $(git --version)"
    
    if command -v gh &> /dev/null; then
        echo "GitHub CLI: $(gh --version | head -n1)"
    fi
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    log_success "개발 환경 확인 완료"
}

# 설정 완료 메시지
print_completion() {
    echo -e "${GREEN}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🎉 개발 환경 설정이 완료되었습니다!"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${NC}"
    
    echo "📋 다음 단계:"
    echo "1. 새 터미널 창을 열어주세요"
    echo "2. 프로젝트를 클론하고 개발을 시작하세요"
    echo "3. 문제가 있으면 docs/troubleshooting.md를 확인해주세요"
    echo ""
    echo "💡 유용한 명령어:"
    echo "  git flow init     - Git Flow 초기화"
    echo "  gh auth login     - GitHub CLI 로그인"
    echo "  npm run setup     - 프로젝트 설정"
    echo ""
    echo "📧 도움이 필요하시면 dev@organization.com으로 연락주세요"
    echo ""
    echo -e "${GREEN}Happy coding! 🚀${NC}"
}

# 메인 실행 함수
main() {
    print_header
    check_system
    check_prerequisites
    check_node_version
    setup_git
    install_dev_tools
    setup_project_templates
    verify_setup
    print_completion
}

# 스크립트 실행
main "$@" 