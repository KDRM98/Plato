<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 수정</title>
    <!-- css -->
    <link rel="stylesheet" href="/Eunsol/css/reset.css">
    <link rel="stylesheet" href="/Eunsol/css/common.css">
    <link rel="stylesheet" href="/Eunsol/css/style.css">

    <!-- js -->
    <script src="/Eunsol/js/common.js"></script>
    <script src="/Eunsol/js/script.js"></script>
</head>

<body>

    <!-- 헤더 -->
    <header>

    </header>

    <!-- 전체 영역 -->
    <main>
        <h1 class="title">프로필 수정</h1>

        <section class="modified-item">

            <div>
                <div class="text nickname"><span>별명</span></div>
                <input type="text" id="nickname" class="input nickname" name="nickname" required>
                <button type="button" class="duplicate-check-button"><span class="jungbok">중복확인</span></button>
                <div class="error nickname_error"><span>이미 사용중인 별명입니다.</span></div>
            </div>

            <div>
                <div class="text password"><span>비밀번호</span></div>
                <input type="password" id="password" class="input password" name="password" required>
            </div>

            <div>
                <div class="password check"><span class="text_name_1">비밀번호 확인</span></div>
                <input type="password" id="password-check" class="input password-check" name="password-check" required>
                <div class="error nickname_error"><span>비밀번호가 일치하지 않습니다.</span></div>
            </div>

            <div>
                <div class="text email"><span class="text_name_1">이메일</span></div>
                <input type="email" id="email" class="input email" name="email" required>
            </div>

            <div class = "box">
                <div class="gender-box">
                    <div class="text gender"><span>성별</span></div>
                    <select id="gender" name="gender">
                        <option value="">성별</option>
                        <option value="male">여성</option>
                        <option value="female">남성</option>
                    </select>
                </div>

                <div class="age-box">
                    <div class="text age"><span>연령대</span></div>
                    <select id="age" name="age">
                        <option value="">연령대</option>
                        <option value="10s">10대</option>
                        <option value="20s">20대</option>
                        <option value="30s">30대</option>
                        <option value="40s">40대</option>
                        <option value="50s">50대</option>
                        <option value="60s">60대 이상</option>
                    </select>
                </div>
            </div>
            
            <div>
                <button type="submit" class="signup-button">저장하기</button>
            </div>

        </section>

        <hr>

        <section class="unregister">
            <div class="title"><span>회원탈퇴</span></div>
            <p>
                사용하고 계신 아이디는 탈퇴할 경우 재사용 및 <span class="highlight">복구가 불가능합니다.</span><br>
                탈퇴한 아이디는 본인과 타인 모두 <span class="highlight">재사용 및 복구가 불가하오니</span> 신중하게 선택하시기 바랍니다.<br>
                회원 탈퇴를 진행했을 경우, 30일 이후에 자동으로 <span class="highlight">삭제</span>됩니다. <br>
                삭제를 취소하고 싶을 경우 저희 고객센터(biz@plato.co.kr)을 통해 연락주시기 바랍니다.<br>
            </p>
            <div class="agreement">
                <input type="checkbox" id="agreement" name="agreement">
                <label for="agreement"><span>회원 탈퇴에 동의합니다.</span></label>
            </div>
            <div>
                <button type="submit" class="unregister-button">회원 탈퇴</button>
            </div>
        </section>

    </main>

    <!-- 풋터 -->
    <footer>

    </footer>
</body>

</html>