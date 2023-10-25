<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보험금 청구 화면01</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/backgroundClaim01.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/button.css" />
    <!--로그인, 회원가입, 질병예측하기 버튼 자동 가운데 정렬 문제 일으켰던 부분, donut 처리함-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommend.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/claim.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/recommendmodal.css" />
    <!--날짜-->
    <!--map 날짜-->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/map.css" />

    <style>
        body {
            text-align: center; /* 내용을 가운데 정렬 */
        }
        .content-section {
            margin-top: 50px; /* 상단 여백 추가 */
        }
        .section-header {
            font-size: 50px; /* 글자 크기 */
            font-weight: 500; /* 글자 진하기 */
            margin-bottom: 10px; /* 문구 아래 여백 */
        }
        .section-description {
            font-size: 16px; /* 글자 크기 */
        }
        .table {
            border-collapse: collapse;
            width: 100%;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .table th {
            background-color: #E9F2F1;

            color: black;
        }
        .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
        .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
        .map_wrap {position:relative;width:100%;height:500px;}
        #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
        .bg_white {background:#fff;}
        #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
        #menu_wrap .option{text-align: center;}
        #menu_wrap .option p {margin:10px 0;}
        #menu_wrap .option button {margin-left:5px;}
        #placesList li {list-style: none;}
        #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
        #placesList .item span {display: block;margin-top:4px;}
        #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
        #placesList .item .info{padding:10px 0 10px 55px;}
        #placesList .info .gray {color:#8a8a8a;}
        #placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
        #placesList .info .tel {color:#009900;}
        #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
        #placesList .item .marker_1 {background-position: 0 -10px;}
        #placesList .item .marker_2 {background-position: 0 -56px;}
        #placesList .item .marker_3 {background-position: 0 -102px}
        #placesList .item .marker_4 {background-position: 0 -148px;}
        #placesList .item .marker_5 {background-position: 0 -194px;}
        #placesList .item .marker_6 {background-position: 0 -240px;}
        #placesList .item .marker_7 {background-position: 0 -286px;}
        #placesList .item .marker_8 {background-position: 0 -332px;}
        #placesList .item .marker_9 {background-position: 0 -378px;}
        #placesList .item .marker_10 {background-position: 0 -423px;}
        #placesList .item .marker_11 {background-position: 0 -470px;}
        #placesList .item .marker_12 {background-position: 0 -516px;}
        #placesList .item .marker_13 {background-position: 0 -562px;}
        #placesList .item .marker_14 {background-position: 0 -608px;}
        #placesList .item .marker_15 {background-position: 0 -654px;}
        #pagination {margin:10px auto;text-align: center;}
        #pagination a {display:inline-block;margin-right:10px;}
        #pagination .on {font-weight: bold; cursor: default;color:#777;}
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<jsp:include page="./header.jsp"/>
<body>
<div class="content-section">
    <div class="section-header">
        1. 청구 내역 작성하기
    </div>
    <div class="section-description">
        보험금 청구를 위한 청구 내역을 작성하세요.
    </div>
    <div class="main-feature-section">
                <label class="form-label" style="text-align: left; display: block;">1. 보험상품 선택</label>
                <button type="button" class="info-button" style="text-align: left; display: block;" data-toggle="modal" data-target="#myProductListModal">내 보험상품 조회하기</button>
                <!-- 선택한 보험상품 정보를 보여줄 테이블 추가 -->
                <table class="table table-bordered selected-products" style="margin-top: 20px; width:850px; background-color: white;">
                    <thead>
                    <tr>
                        <th>보험상품ID</th>
                        <th>보험회사</th>
                        <th>보험상품명</th>
                    </tr>
                    </thead>
                    <tbody>
                        <input type="hidden" id="selectedProductId" value="">
                    </tbody>
                </table>
        <div class="modal" id="myProductListModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header" style="text-align: left">
                        <h4 class="modal-title">내 보험 상품</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body" style="text-align: left;">

                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-feature-section">
                <label for="placeinput" class="form-label" style="text-align: left; display: block;">2. 질병 발생 장소</label>
                <div class="map_wrap">
                    <div id="map" style="width:100%; height:100%; position:relative; overflow:hidden;"></div>

                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div>
                                <form onsubmit="searchPlaces(); return false;">
                                    키워드 : <input type="text" value="광명융합기술교육원" id="keyword" size="15">
                                    <button type="submit">검색하기</button>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
                <input style="margin-top: 10px" type="text" class="form-control" id="placeinput" placeholder="ex) 실내 체육관">

    </div>
    <div class="main-feature-section">
        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px; background-color: #E9F2F1">
            <div class="mb-3" style="width: 80%;">
                <label for="claimcontentinput" class="form-label" style="text-align: left; display: block;">3. 청구 내용</label>
                <textarea class="form-control" id="claimcontentinput" rows="4" placeholder="ex) 골절상"
                style="width: 800px;"></textarea>
            </div>
        </div>

        <div class="row sample-card" style="margin: 10px; margin-bottom: 20px; background-color: #E9F2F1;">
            <div class="mb-3" style="width: 100%;">
            <label style="margin-bottom: 10px; text-align: left; display: block;">4. 질병 발생 날짜</label>
            <div id="datepicker" ></div>
            <input type="hidden" id="selectedDate" />
                <div id="selectedDateDisplay" style="margin-top:10px; float:left; text-align: left; background-color: white; width: 20%;">
                </div>
            </div>
        </div>
    </div>
    <div class="main-feature-section">
        <div class="row sample-card" style="margin: 10px; margin-bottom: 10px; background-color: #E9F2F1;">
            <div class="mb-3" style="width: 50%;">
                <label for="bankinput" class="form-label" style="text-align: left; display: block; width: auto; margin-right: 10px;">5. 청구금 수령 은행 및 계좌번호</label>
                <input type="text" class="form-control" id="bankinput" placeholder="ex) 하나은행" style="display: block; width: calc(100% - 220px);">
                <label for="accountnuminput" class="form-label" style="text-align: left; display: block; width: auto; margin-right: 10px;"></label>
                <input type="text" class="form-control" id="accountnuminput" placeholder="'-'없이 입력, ex)41291070558207" style="display: block; width: calc(100%);">
            </div>
        </div>
    </div>
</div>
</div>

<button class="complete-button" type="button" onclick="submitClaimData()">다음</button>


<footer style="background: #00a39e; padding: 40px 0; color: #fff; text-align: center;">
    <p style="font-size: 16px; margin: 0;">© 2023 1Q Insurance. All rights reserved.</p>
    <p style="font-size: 14px; margin: 10px 0 0;">인천 서구 에코로 167 하나금융그룹 통합데이터센터 비전센터</p>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS and Popper.js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00c9608c54d7316013ba655f357d385e&libraries=services"></script>

<style>
    /* 선택한 날짜의 배경색과 글자색 변경 */
    .datepicker .day.active {
        background-color: #00a39e; /* 선택한 날짜의 배경색 */
        color: white; /* 글자색 */
    }

    /* 달력의 배경색 지정 */
    .datepicker {
        background-color: white;
    }
</style>

<script>
    $(document).ready(function(){
        $('#datepicker').datepicker({
            format: 'yyyy-mm-dd',
            todayHighlight: true,
            orientation: 'bottom'
        });
    });

    $(document).ready(function(){
        $('#datepicker').datepicker().on('changeDate', function(e) {
            // 선택된 날짜 가져오기
            var selectedDate = e.date;

            // 날짜 형식을 "yyyy-mm-dd"로 변환 (예: 2023-09-23)
            var formattedDate = selectedDate.getFullYear() + '-' +
                ('0' + (selectedDate.getMonth() + 1)).slice(-2) + '-' +
                ('0' + selectedDate.getDate()).slice(-2);

            // 선택된 날짜를 input 필드에 설정
            $('#selectedDate').val(formattedDate);

            // 선택된 날짜를 페이지에 표시
            $('#selectedDateDisplay').text(formattedDate);

            // 선택한 날짜의 배경색과 텍스트 정렬을 변경
            $('#datepicker .datepicker-days .day.active').css({
                'background-color': 'white',
                'color': 'black',
                'text-align': 'left'
            });
        });
    });
</script>
<script>
    $(document).ready(function() {
        $(".info-button").click(function() {
            var userId = 3;

            $.get("/getMyProducts", {userId: 3}, function(data) {
                var content = '<table class="table table-bordered">'; //
                content += '<thead>'; // 헤더 시작
                content += '<tr>';
                content += '<th></th>'; // 클릭 버튼을 위한 헤더
                content += '<th>보험상품ID</th>';
                content += '<th>보험회사</th>';
                content += '<th>보험상품명</th>';
                content += '</tr>';
                content += '</thead>'; // 헤더 종료
                content += '<tbody>'; // 본문 시작

                for (var i = 0; i < data.length; i++) {
                    content += '<tr>';
                    content += '<td><button class="select-button">선택</button></td>'; // 클릭 버튼 추가
                    content += '<td>' + data[i].insuranceproductid + '</td>';
                    content += '<td>' + data[i].insurancecompanyname + '</td>';
                    content += '<td>' + data[i].insurancename + '</td>';
                    content += '</tr>';
                }

                content += '</tbody>'; // 본문 종료
                content += '</table>'; // 표의 종료

                $(".modal-body").html(content);

                $(".select-button").click(function() {
                    var row = $(this).closest('tr');
                    var productId = row.find('td:eq(1)').text();
                    $("#selectedProductId").val(productId);
                    var companyName = row.find('td:eq(2)').text();
                    var productName = row.find('td:eq(3)').text();

                    var newRow = '<tr>';
                    newRow += '<td>' + productId + '</td>';
                    newRow += '<td>' + companyName + '</td>';
                    newRow += '<td>' + productName + '</td>';
                    newRow += '</tr>';


                    $(".selected-products tbody").append(newRow);

                    $('#myProductListModal').modal('hide');
                });
            });
        });
    });
</script>
<script>
    function submitClaimData() {
        console.log($("#selectedProductId").val());

        // 데이터 수집
        var insuranceProductId = $("#selectedProductId").val();
        var place = $("#placeinput").val();
        var claimContent = $("#claimcontentinput").val();
        var selectedDate = $("#selectedDate").val();
        var bank = $("#bankinput").val();
        var accountNumber = $("#accountnuminput").val();

        // AJAX 요청
        $.ajax({
            url: "<%= request.getContextPath() %>/insertClaim",
            type: "POST",
            data: {
                insuranceProductId: insuranceProductId,
                place: place,
                claimContent: claimContent,
                selectedDate: selectedDate,
                bank: bank,
                accountNumber: accountNumber
            },
            success: function(response) {
                // 성공시 처리
                if(response.success) {
                    alert("성공적으로 제출되었습니다.");
                } else {
                    //alert("성공2");
                }
                window.location.href = "<%= request.getContextPath() %>/showClaim02";
            },
            error: function(xhr, status, error) {
                // 에러시 처리
                alert("요청 처리 중 에러가 발생했습니다. 다시 시도해주세요.");
            }
        });
    }
</script>

<!--지도 관련 script-->
<script>
    // 마커를 담을 배열입니다
    var markers = [];

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng( 37.477355491400154, 126.86258391353894), // 지도의 중심좌표
            level: 4 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB);
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);

        // 클릭한 장소명을 input 필드에 설정, 수정한 부분
        document.getElementById('placeinput').value = title;
    }

    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
</script>
</body>
</html>
