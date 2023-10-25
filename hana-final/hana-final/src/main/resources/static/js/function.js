/**
 * 문자열의 마지막(끝) 문자의 종성 포함 여부 확인
 * @param value - Target String
 * @returns 종성 포함 여부
 */
function hasCoda(value) {
    return ((value.charCodeAt(value.length - 1) - 0xAC00) % 28) > 0;
}


/**
 * 필드(Elemenet) 유효성 검사
 * @param target - 검사 대상 Element
 * @param fieldName - 필드명
 * @param focusTarget - 포커스 대상 Element
 * @returns 필드 입력(선택) 여부
 */
function isValid(target, fieldName, focusTarget) {
    if (target.value.trim()) {
        return true;
    }

    const particle = (hasCoda(fieldName)) ? '을' : '를'; // 조사
    const elementType = (target.type === 'text' || target.type === 'password' || target.type === 'search' || target.type === 'textarea') ? '입력' : '선택';
    alert( `${fieldName + particle} ${elementType}해 주세요.` );

    target.value = '';
    ( !focusTarget ? target : focusTarget).focus();
    throw new Error(`"${target.id}" is required...`)
}


/**
 * 데이터 조회
 * @param uri - API Request URI
 * @param params - Parameters
 * @returns json - 결과 데이터
 */
function getJson(uri, params) {

    let json = {}

    $.ajax({
        url : uri,
        type : 'get',
        dataType : 'json',
        data : params,
        async : false,
        success : function (response) {
            json = response;
        },
        error : function (request, status, error) {
            console.log(error)
        }
    })

    return json;
}


/**
 * 데이터 저장/수정/삭제
 * @param uri - API Request URI
 * @param method - API Request Method
 * @param params - Parameters
 * @returns json - 결과 데이터
 */
function callApi(uri, method, params) {

    let json = {}

     $.ajax({
        url : uri,
        type : method,
        contentType : 'application/json; charset=utf-8',
        dataType : 'json',
        data : (params) ? JSON.stringify(params) : {},
        async : false,
        success : function (response) {
            json = response;
        },
        error : function (request, status, error) {
            console.log(error)
        }
    })

    return json;
}
// 선택 버튼을 모두 선택
const selectButtons = document.querySelectorAll('.select-button');

// 각 버튼에 클릭 이벤트 리스너 추가
selectButtons.forEach((button) => {
    button.addEventListener('click', function() {
        // 'selected' 클래스 토글
        this.classList.toggle('selected');

        // 상위 .hospital-box에도 'selected' 클래스를 토글
        this.closest('.hospital-box').classList.toggle('selected');
    });
});

document.querySelector('.complete-button').addEventListener('click', function() {
    // 로딩 화면 보이기
    document.getElementById('loading').style.display = 'block';

    // 3초 후 페이지 이동
    setTimeout(function() {
        window.location.href = '<%= request.getContextPath() %>/predict02';
    }, 3000);
});

//modal 관련
var modal = document.getElementById("medicineModal");
var btn = document.getElementById("showModalBtn");
var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
    modal.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// 페이지가 로딩된 후 실행되는 함수냥냥
window.onload = function() {
    // 선택 버튼들을 모두 선택해냥냥
    var selectButtons = document.querySelectorAll('.select-button');

    selectButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var icon = this.querySelector('.fa-check');
            // 버튼이 클릭되면, "fa-check" 클래스가 있는 요소 (체크 아이콘)의 display 속성을 바꿔냥냥
            icon.style.display = icon.style.display === 'none' ? '' : 'none';
        });
    });
}

