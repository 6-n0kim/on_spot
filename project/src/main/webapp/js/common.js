// 팝업 관련 함수
function initPopup() {
    var target = document.querySelectorAll('.btn_open');
    var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
    var targetID;

    // 팝업 열기
    for(var i = 0; i < target.length; i++){
        target[i].addEventListener('click', function(){
            targetID = this.getAttribute('href');
            document.querySelector(targetID).style.display = 'block';
        });
    }

    // 팝업 닫기
    for(var j = 0; j < btnPopClose.length; j++){
        btnPopClose[j].addEventListener('click', function(){
            this.parentNode.parentNode.style.display = 'none';
        });
    }
}

// 카카오맵 초기화 함수
function initKakaoMap() {
    var mapContainer = document.getElementById('map');
    if (!mapContainer) return;

    var mapOption = {
        center: new kakao.maps.LatLng(37.56612, 126.97801),
        level: 3,
        mapTypeId: kakao.maps.MapTypeId.ROADMAP
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var marker = new kakao.maps.Marker({
        position: map.getCenter()
    });
    marker.setMap(map);

    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        var latlng = mouseEvent.latLng;
        marker.setPosition(latlng);
    });
}

// 댓글 작성 함수
function insertCom(form) {
    if (!form.comment.value.trim()) {
        alert('댓글을 입력해주세요.');
        return false;
    }
    return true;
}

// 페이지 로드 시 초기화
document.addEventListener('DOMContentLoaded', function() {
    initPopup();
    initKakaoMap();
}); 