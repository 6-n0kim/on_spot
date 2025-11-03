# 📍 On Spot — 위치 기반 소셜 미디어 플랫폼

**위치 기반 소셜 미디어 플랫폼**의 웹 애플리케이션입니다.  
내 주변의 경험을 공유하고, 지도 위에서 새로운 사람들의 이야기를 발견하는 공간

---

## 🧭 프로젝트 개요

| 항목           | 내용                                                                                |
| -------------- | ----------------------------------------------------------------------------------- |
| **프로젝트명** | On Spot                                                                             |
| **기간**       | 2022.07 – 2022.09 (약 3개월)                                                        |
| **팀 규모**    | 1인                                                                                 |
| **담당 역할**  | **전체 업무 담당**                                                                  |
| **목표**       | “위치 기반 SNS”로 사용자가 실제 장소에서 경험을 공유하고 소통할 수 있는 플랫폼 구축 |

---

## 🧩 문제 정의

기존 SNS에서는 게시물이 시간순으로만 정렬되어 **“지금 이 장소 주변에서 무슨 일이 있는가”**를 알기 어려움.
이를 해결하기 위해 위치 데이터를 중심으로 콘텐츠를 탐색할 수 있는 플랫폼을 설계했습니다.

해결 방향

게시물에 위치 정보와 좌표를 결합 → 지도 기반 탐색

Kakao Map SDK로 실제 장소 중심의 UI 제공

Oracle 기반 데이터 구조로 다중 사용자 요청 처리 안정화

---

## 🚀 주요 기능

- 🔐 **회원 관리** – 회원가입, 로그인, 아이디/비밀번호 찾기, 마이페이지
- 📝 **게시물 기능** – 위치 기반 게시물 작성, 조회, 수정, 삭제
  - 게시물 작성 (이미지 업로드, 위치 정보)
  - 최신순/인기순/팔로우 게시물 조회
  - 위치 기반 게시물 검색
- 💬 **댓글 시스템** – 게시물별 댓글 작성 및 조회
- 🗺️ **지도 기능** – Kakao Map SDK 기반 지도 탐색 및 마커 표시
- 👥 **소셜 기능** – 사용자 검색, 팔로우, 좋아요 (UI 구현)
- 📸 **이미지 관리** – 프로필 이미지 및 게시물 이미지 업로드

---

## ⚙️ 기술 스택

| 구분                | 기술                                    | 선택 이유                                             |
| ------------------- | --------------------------------------- | ----------------------------------------------------- |
| **Backend**         | **Java (JSP/Servlet)**                  | Tomcat 기반 Web MVC 구조 구현, 빠른 배포 및 학습 효율 |
| **DB**              | **Oracle Database 11g**                 | 트랜잭션 안정성과 SQL 튜닝 경험 확보 목적             |
| **Frontend**        | **HTML5, CSS3, JavaScript (Bootstrap)** | 반응형 UI, 유지보수 용이                              |
| **Map API**         | **Kakao Maps SDK**                      | 한국 사용자 친화적 지도 API, 마커 이벤트 처리 용이    |
| **File Upload**     | **COS (Multipart)**                     | 이미지 파일 업로드 처리 간결                          |
| **Server**          | **Apache Tomcat 8.5**                   | JSP 호환성 및 배포 편의성                             |
| **Version Control** | GitHub                                  | 협업 및 변경 이력 관리                                |
| **IDE**             | Eclipse                                 | Java Web 환경 통합                                    |

---

## 📁 프로젝트 구조

```
project/
├─ src/
│  └─ main/
│     ├─ java/                       # Java 소스 코드
│     │  ├─ db/                      # 데이터베이스 연결
│     │  │  ├─ DBConnPool.java       # 커넥션 풀 관리
│     │  │  └─ JDBConnect.java       # JDBC 직접 연결
│     │  ├─ membership/              # 회원 관리
│     │  │  ├─ MemberDTO.java        # 회원 데이터 전송 객체
│     │  │  └─ MemberDAO.java        # 회원 데이터 접근 객체
│     │  ├─ post/                    # 게시물 관리
│     │  │  ├─ PostDTO.java          # 게시물 데이터 전송 객체
│     │  │  └─ PostDAO.java          # 게시물 데이터 접근 객체
│     │  └─ comment/                 # 댓글 관리
│     │     ├─ CommentDTO.java       # 댓글 데이터 전송 객체
│     │     └─ CommentDAO.java       # 댓글 데이터 접근 객체
│     └─ webapp/                     # 웹 리소스
│        ├─ css/                     # 스타일시트
│        │  ├─ common.css            # 공통 스타일
│        │  ├─ header.css            # 헤더 스타일
│        │  └─ login_form.css        # 로그인 폼 스타일
│        ├─ js/                      # JavaScript 파일
│        │  └─ common.js             # 공통 JavaScript
│        ├─ img/                     # 이미지 리소스
│        │  ├─ on_spot_logo_final.png
│        │  ├─ on_spot_text.png
│        │  └─ ...
│        ├─ Uploads/                 # 업로드된 파일 저장
│        ├─ WEB-INF/                 # 웹 설정
│        │  ├─ lib/                  # 라이브러리
│        │  │  ├─ cos.jar            # 파일 업로드
│        │  │  └─ ojdbc6.jar         # Oracle JDBC 드라이버
│        │  └─ web.xml               # 웹 애플리케이션 설정
│        ├─ main.jsp                 # 메인 페이지 (지도)
│        ├─ login.jsp                # 로그인 페이지
│        ├─ sign_up.jsp              # 회원가입 페이지
│        ├─ header.jsp               # 헤더 컴포넌트
│        ├─ post.jsp                 # 게시물 상세 페이지
│        ├─ createpost.jsp           # 게시물 작성 페이지
│        ├─ post_recent.jsp          # 최신 게시물 목록
│        ├─ post_rank.jsp            # 인기 게시물 목록
│        ├─ post_fol.jsp             # 팔로우 게시물 목록
│        ├─ mypage.jsp               # 마이페이지
│        ├─ search_post.jsp          # 게시물 검색
│        ├─ search_user.jsp          # 사용자 검색
│        └─ ...                      # 기타 JSP 페이지
└─ build/
   └─ classes/                       # 컴파일된 클래스 파일
```

---

## ⚙️ 실행 방법

### 사전 요구사항

1. **Java Development Kit (JDK) 8 이상**
2. **Oracle Database 11g 이상**
3. **Apache Tomcat 8.5 이상**
4. **Oracle JDBC Driver (ojdbc6.jar)** - 이미 `WEB-INF/lib/`에 포함됨

### 데이터베이스 설정

1. **Oracle 데이터베이스 생성 및 사용자 설정**

```sql
-- 예시: scott 사용자로 접속
-- 필요한 테이블 생성
CREATE TABLE TB_USER (
    user_id NUMBER PRIMARY KEY,
    email VARCHAR2(100) UNIQUE NOT NULL,
    pass VARCHAR2(100) NOT NULL,
    tel VARCHAR2(20),
    birth VARCHAR2(20),
    user_name VARCHAR2(50) NOT NULL,
    nickname VARCHAR2(50) NOT NULL,
    gender VARCHAR2(10),
    introduce VARCHAR2(500),
    profile_image VARCHAR2(200) DEFAULT 'profile_image.jpg'
);

CREATE SEQUENCE seq_user_user_id START WITH 1 INCREMENT BY 1;

CREATE TABLE post (
    post_id NUMBER PRIMARY KEY,
    content VARCHAR2(1000),
    location VARCHAR2(200),
    likecount NUMBER DEFAULT 0,
    user_id NUMBER REFERENCES TB_USER(user_id),
    postdate DATE DEFAULT SYSDATE,
    post_file VARCHAR2(200)
);

CREATE SEQUENCE seq_post_post_id START WITH 1 INCREMENT BY 1;

CREATE TABLE TB_comment (
    comment_id NUMBER PRIMARY KEY,
    c_content VARCHAR2(500) NOT NULL,
    user_id NUMBER REFERENCES TB_USER(user_id),
    post_id NUMBER REFERENCES post(post_id)
);

CREATE SEQUENCE seq_com_comment_id START WITH 1 INCREMENT BY 1;
```

2. **커넥션 풀 설정** (context.xml)

`META-INF/context.xml` 또는 Tomcat의 `conf/context.xml`에 추가:

```xml
<Resource
    name="dbcp_myoracle"
    auth="Container"
    type="javax.sql.DataSource"
    driverClassName="oracle.jdbc.OracleDriver"
    url="jdbc:oracle:thin:@localhost:1521:orcl"
    username="scott"
    password="tiger"
    maxTotal="20"
    maxIdle="10"
    maxWaitMillis="10000"/>
```

### 웹 애플리케이션 설정

1. **데이터베이스 연결 정보 확인**

`WEB-INF/web.xml`에서 데이터베이스 연결 정보 확인 및 수정:

```xml
<context-param>
    <param-name>OracleURL</param-name>
    <param-value>jdbc:oracle:thin:@localhost:1521:orcl</param-value>
</context-param>
<context-param>
    <param-name>OracleId</param-name>
    <param-value>scott</param-value>
</context-param>
<context-param>
    <param-name>OraclePwd</param-name>
    <param-value>tiger</param-value>
</context-param>
```

2. **Kakao Maps API 키 설정**

`main.jsp`에서 Kakao Maps API 키 확인:

```javascript
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_MAP_API_KEY"></script>
```

### 빌드 및 실행

1. **프로젝트 컴파일**

```bash
# Java 파일 컴파일 (클래스패스 설정 필요)
javac -cp "WEB-INF/lib/ojdbc6.jar" -d build/classes src/main/java/**/*.java
```

2. **WAR 파일 생성** (선택사항)

```bash
jar -cvf on_spot.war -C project/src/main/webapp .
```

3. **Tomcat 배포**

- **방법 1**: WAR 파일을 `$CATALINA_HOME/webapps/`에 배치
- **방법 2**: 프로젝트 폴더를 `webapps/on_spot/`로 복사
- **방법 3**: IDE에서 Tomcat 서버 설정 및 실행

4. **서버 시작**

```bash
# Tomcat 시작
$CATALINA_HOME/bin/startup.sh  # Linux/Mac
$CATALINA_HOME/bin/startup.bat # Windows
```

5. **접속**

브라우저에서 `http://localhost:8080/on_spot/main.jsp` 접속

---

## 🗺️ 페이지 구조

| 경로                 | 설명               | 인증 필요 |
| -------------------- | ------------------ | --------- |
| `/start_display.jsp` | 시작 화면 (로고)   | ❌        |
| `/login.jsp`         | 로그인 페이지      | ❌        |
| `/sign_up.jsp`       | 회원가입 페이지    | ❌        |
| `/main.jsp`          | 메인 페이지 (지도) | ✅        |
| `/post.jsp`          | 게시물 상세 페이지 | ✅        |
| `/createpost.jsp`    | 게시물 작성 페이지 | ✅        |
| `/post_recent.jsp`   | 최신 게시물 목록   | ✅        |
| `/post_rank.jsp`     | 인기 게시물 목록   | ✅        |
| `/post_fol.jsp`      | 팔로우 게시물 목록 | ✅        |
| `/mypage.jsp`        | 마이페이지         | ✅        |
| `/editMyPage.jsp`    | 마이페이지 수정    | ✅        |
| `/search_post.jsp`   | 게시물 검색        | ✅        |
| `/search_user.jsp`   | 사용자 검색        | ✅        |
| `/find_id.jsp`       | 아이디 찾기        | ❌        |
| `/find_pwd.jsp`      | 비밀번호 찾기      | ❌        |

---

## 🎨 UI/UX 특징

### 디자인 시스템

- **Color Palette**: Blue 계열 (Primary: #007bff)
- **Layout**: Instagram 스타일 레이아웃
- **Components**: Bootstrap 기반 반응형 디자인
- **Icons**: Font Awesome 아이콘 라이브러리

### 주요 UI 컴포넌트

- **Header**: 로고, 검색, 홈, 게시물 작성, 메시지, 알림, 로그아웃, 프로필
- **Card**: 게시물 카드, 사용자 카드
- **Map**: Kakao Map 기반 지도 및 마커
- **Modal**: 팝업 창 (게시물 수정/삭제)
- **Form**: 로그인, 회원가입, 게시물 작성 폼

### 맵 기능

- **Kakao Maps SDK** 통합
- **지도 클릭**: 마커 위치 설정
- **게시물 위치**: 게시물에 위치 정보 연동

---

## 🔄 데이터베이스 스키마

### TB_USER (회원 테이블)

| 컬럼명        | 타입          | 설명                 |
| ------------- | ------------- | -------------------- |
| user_id       | NUMBER (PK)   | 회원 ID (시퀀스)     |
| email         | VARCHAR2(100) | 이메일 (로그인 ID)   |
| pass          | VARCHAR2(100) | 비밀번호             |
| tel           | VARCHAR2(20)  | 전화번호             |
| birth         | VARCHAR2(20)  | 생년월일             |
| user_name     | VARCHAR2(50)  | 이름                 |
| nickname      | VARCHAR2(50)  | 닉네임               |
| gender        | VARCHAR2(10)  | 성별                 |
| introduce     | VARCHAR2(500) | 자기소개             |
| profile_image | VARCHAR2(200) | 프로필 이미지 파일명 |

### post (게시물 테이블)

| 컬럼명    | 타입           | 설명                 |
| --------- | -------------- | -------------------- |
| post_id   | NUMBER (PK)    | 게시물 ID (시퀀스)   |
| content   | VARCHAR2(1000) | 게시물 내용          |
| location  | VARCHAR2(200)  | 위치 정보            |
| likecount | NUMBER         | 좋아요 수            |
| user_id   | NUMBER (FK)    | 작성자 ID            |
| postdate  | DATE           | 작성일시             |
| post_file | VARCHAR2(200)  | 게시물 이미지 파일명 |

### TB_comment (댓글 테이블)

| 컬럼명     | 타입          | 설명             |
| ---------- | ------------- | ---------------- |
| comment_id | NUMBER (PK)   | 댓글 ID (시퀀스) |
| c_content  | VARCHAR2(500) | 댓글 내용        |
| user_id    | NUMBER (FK)   | 작성자 ID        |
| post_id    | NUMBER (FK)   | 게시물 ID        |

---

## 🔍 주요 기능 상세

### 1. 회원 관리

- **회원가입**: 이메일, 비밀번호, 이름, 닉네임, 전화번호, 생년월일, 성별 입력
- **로그인**: 이메일/비밀번호 기반 인증, 세션 관리
- **아이디 찾기**: 이름, 전화번호, 생년월일로 이메일 조회
- **비밀번호 찾기**: 임시 비밀번호(1234)로 초기화
- **마이페이지**: 프로필 정보 조회 및 수정
- **회원 탈퇴**: 계정 삭제

### 2. 게시물 기능

- **게시물 작성**: 이미지 업로드, 내용, 위치 정보 입력
- **게시물 조회**: 최신순, 인기순, 팔로우 게시물 목록
- **게시물 상세**: 작성자 정보, 이미지, 내용, 위치, 좋아요 수, 댓글
- **게시물 수정/삭제**: 작성자만 수정/삭제 가능
- **게시물 검색**: 위치 기반 검색

### 3. 댓글 시스템

- **댓글 작성**: 게시물별 댓글 작성
- **댓글 조회**: 게시물별 댓글 목록 (작성자 정보 포함)

### 4. 지도 기능

- **Kakao Maps SDK** 통합
- **지도 표시**: 메인 페이지에 지도 표시
- **마커 표시**: 지도 클릭으로 마커 위치 설정

### 5. 사용자 검색

- **닉네임 검색**: 닉네임으로 사용자 검색

---

## 🛠️ 아키텍처 패턴

### MVC 패턴

- **Model**: DTO (Data Transfer Object), DAO (Data Access Object)
- **View**: JSP 페이지
- **Controller**: JSP 내 스크립틀릿 및 서블릿 (간단한 형태)

### 데이터베이스 연결

- **커넥션 풀**: `DBConnPool` 클래스 (DataSource 기반)
- **직접 연결**: `JDBConnect` 클래스 (JDBC 직접 연결)
- **PreparedStatement**: SQL Injection 방지

---

## ⚠️ 보안 고려사항

### 현재 상태

- ✅ **PreparedStatement 사용**: 대부분의 쿼리에서 사용
- ⚠️ **SQL Injection 취약점**: 일부 검색 쿼리에서 문자열 연결 사용
- ⚠️ **비밀번호 평문 저장**: 암호화 미적용
- ⚠️ **하드코딩된 DB 정보**: web.xml에 직접 작성

### 개선 권장사항

1. **SQL Injection 방지**: 모든 쿼리를 PreparedStatement로 전환
2. **비밀번호 암호화**: BCrypt 등 해싱 알고리즘 적용
3. **설정 외부화**: DB 정보를 properties 파일로 분리
4. **파일 업로드 검증**: 파일 타입 및 크기 제한
5. **XSS 방지**: 사용자 입력값 이스케이프 처리
6. **CSRF 토큰**: POST 요청에 토큰 검증 추가

---

## 🧪 개발 환경 설정

### IDE 설정 (Eclipse/IntelliJ)

1. **프로젝트 Import**: Java Web Project로 Import
2. **서버 설정**: Apache Tomcat 서버 추가
3. **라이브러리 경로**: `WEB-INF/lib/` 확인
4. **인코딩 설정**: UTF-8로 통일

### 디버깅

- `System.out.println()` 기반 로깅
- 브라우저 개발자 도구 활용
- Tomcat 로그 확인 (`$CATALINA_HOME/logs/`)

---

## 📋 체크리스트

✅ JDK 8+ 설치 완료  
✅ Oracle Database 설치 및 설정 완료  
✅ Apache Tomcat 설치 완료  
✅ 데이터베이스 테이블 및 시퀀스 생성 완료  
✅ 커넥션 풀 설정 완료 (선택사항)  
✅ Kakao Maps API Key 발급 완료  
✅ 파일 업로드 디렉토리 권한 설정 완료

---

## 🐳 배포 (선택사항)

### WAR 파일 배포

```bash
# WAR 파일 생성
jar -cvf on_spot.war -C project/src/main/webapp .

# Tomcat에 배포
cp on_spot.war $CATALINA_HOME/webapps/
```

### Docker (추가 구현 필요)

현재 프로젝트에는 Docker 설정이 없지만, 다음과 같이 구성 가능:

```dockerfile
FROM tomcat:9-jdk8
COPY project/src/main/webapp /usr/local/tomcat/webapps/on_spot
EXPOSE 8080
```

---

## 📦 주요 라이브러리

### 포함된 JAR 파일

- `ojdbc6.jar`: Oracle JDBC Driver
- `cos.jar`: 파일 업로드 라이브러리

### 외부 CDN 리소스

- **Bootstrap**: 4.0.0, 5.0.2
- **Font Awesome**: 아이콘 라이브러리
- **Kakao Maps SDK**: 지도 API

---

## 🔄 세션 관리

- **세션 타임아웃**: 20분 (web.xml 설정)
- **세션 저장 정보**: user_id, email, nickname, profile_image
- **인증 체크**: JSP 페이지에서 `session.getAttribute()` 확인

---

## 📝 개발 노트

### 파일 업로드

- 업로드 경로: `webapp/Uploads/`
- 라이브러리: COS (com.servlets.cos)
- 지원 형식: 이미지 파일

### 인코딩

- 페이지 인코딩: UTF-8
- 필터 설정: `SetCharacterEncodingFilter` (UTF-8)

---

## 👥 프로젝트 정보

**On Spot**  
위치 기반 소셜 미디어 플랫폼

---

## 📄 라이선스

본 프로젝트의 저작권은 해당 개발팀에 있으며,  
상용 및 배포 정책은 별도 라이선스 조항을 따릅니다.
