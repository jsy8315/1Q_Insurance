// 페이지 로딩 완료 후 실행
window.onload = function() {
    setTimeout(function() {
        // 로딩 표시 숨기기
        document.getElementById('loading').style.display = "none";

        // 완료 메시지와 버튼 표시
        document.getElementById('completed').style.display = "block";
    }, 2000); // 3초 후 실행
}

// 모달 창 닫기
function closeModal() {
    document.getElementById('myModal').style.display = "none";
}
