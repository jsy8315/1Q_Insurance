document.addEventListener('DOMContentLoaded', function() {
    let selectedItems = [];

    // 초기화 함수
    function resetSearch() {
        //document.getElementById('input-section').classList.remove('drugResultHidden');
        //document.getElementById('result').classList.add('drugResultHidden');
        //document.getElementById('result').innerHTML = ''; // 이전 검색 결과 삭제
    }

    document.getElementById('search').addEventListener('click', function() {
        document.getElementById('input-section').classList.remove('drugResultHidden');
        document.getElementById('result').classList.add('drugResultHidden');
        document.getElementById('result').innerHTML = ''; // 이전 검색 결과 삭제
        resetSearch(); // 검색을 초기화

        const companyName = document.getElementById('company-name').value;
        const productName = document.getElementById('product-name').value;

        const apiUrl = `https://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList?serviceKey=SO2bSmt0Mc0SoG3pu9Q1Ze4R%2BxWkD6OGNYZ1Sqyzb%2F7LA5TLtRnttIPB8OtoyPG0zbPyWOE%2F6dTjJPUuheogbQ%3D%3D&pageNo=1&numOfRows=3&entpName=${companyName}&itemName=${productName}&type=json`;

        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                const resultDiv = document.getElementById('result');

                let tableHtml = '<table id="medicalTestTable">';
                tableHtml += '<tr><th>회사명</th><th>제품명</th><th>제품 코드</th><th>선택</th></tr>';

                if(data && data.body && data.body.items) {
                    data.body.items.forEach(item => {
                        tableHtml += `<tr><td>${item.entpName}</td><td>${item.itemName}</td><td>${item.itemSeq}</td><td><input type="checkbox" class="item-checkbox"></td></tr>`;
                    });
                } else {
                    tableHtml += '<tr><td colspan="4">Unexpected API response</td></tr>';
                }

                tableHtml += '</table>';
                tableHtml += '<button id="complete-selection">선택완료</button>';
                resultDiv.innerHTML = tableHtml;

                document.querySelectorAll('.item-checkbox').forEach((checkbox, index) => {
                    checkbox.addEventListener('change', function() {
                        if (this.checked) {
                            selectedItems.push(data.body.items[index]);
                        } else {
                            selectedItems = selectedItems.filter(item => item.itemSeq !== data.body.items[index].itemSeq);
                        }
                    });
                });

                document.getElementById('complete-selection').addEventListener('click', function() {
                    displaySelectedItems(selectedItems);
                    //모달창 닫기
                    document.getElementById('medicineModal').style.display = 'none';

                });

                document.getElementById('input-section').classList.add('drugResultHidden');
                document.getElementById('result').classList.remove('drugResultHidden');
            })
            .catch(error => {
                console.error('API 요청 에러:', error);
            });
    });
});

function displaySelectedItems(selectedItems) {
    let displayTableHtml = '<table class="medicalTestTable">';
    displayTableHtml += '<thead><tr><th>회사명</th><th>제품명</th><th>제품 코드</th></tr></thead>';
    displayTableHtml += '<tbody>';

    selectedItems.forEach(item => {
        displayTableHtml += `<tr><td>${item.entpName}</td><td>${item.itemName}</td><td>${item.itemSeq}</td></tr>`;
    });

    displayTableHtml += '</tbody>';
    displayTableHtml += '</table>';

    const displayDiv = document.getElementById('selected-items-section');
    displayDiv.innerHTML = displayTableHtml;
}
