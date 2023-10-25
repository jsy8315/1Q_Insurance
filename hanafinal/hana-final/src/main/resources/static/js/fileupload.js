$(document).ready(function(){
    var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        } else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.upload-name').val(filename);

        // 이미지 미리보기
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            if (!$(this)[0].files[0].type.match(/image\//)) return;

            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');
            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";
        }

    });

    var modal = document.getElementById("previewModal");
    var btn = document.getElementById("previewBtn");
    var span = document.getElementsByClassName("close-btn")[0];

    btn.onclick = function() {
        modal.style.display = "block";
        document.getElementById('previewImage').src = $('.upload-thumb').attr('src');
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
});
$(document).ready(function(){
    // 기존의 진단서 코드는 그대로 둡니다.

    // 입퇴원증명서에 대한 코드 추가
    var fileTargetHosp = $('#input_file_hosp');

    fileTargetHosp.on('change', function(){
        // ... (나머지 코드는 진단서와 동일)
    });

    var modalHosp = document.getElementById("previewModal_hosp");
    var btnHosp = document.getElementById("previewBtn_hosp");
    var spanHosp = document.getElementsByClassName("close-btn")[1];  // 두 번째 'close-btn' 클래스를 선택합니다.

    btnHosp.onclick = function() {
        modalHosp.style.display = "block";
        document.getElementById('previewImage_hosp').src = $('.upload-thumb').last().attr('src'); // 마지막 미리보기 이미지를 선택
    }

    spanHosp.onclick = function() {
        modalHosp.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modalHosp) {
            modalHosp.style.display = "none";
        }
    }
});
