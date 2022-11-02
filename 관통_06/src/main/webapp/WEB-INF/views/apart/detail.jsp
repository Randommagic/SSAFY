<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>

<body id="page-top">
	<!-- Navigation-->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-heading text-uppercase">It's Nice To Meet
				You</div>
		</div>
	</header>

	<div class="row">
		<div class="row align-items-center">
			<div class="col-md-12 col-sm-12">
				<table class="table table-hover text-center" style="">
					<tr>
						<th>아파트이름</th>
						<th>층</th>
						<th>면적</th>
						<th>법정동</th>
						<th>거래금액</th>
					</tr>
					<tr>
						<td>${homeinfo.apt_name }</td>
						<td>${homeinfo.floor }</td>
						<td>${homeinfo.area }</td>
						<td>${homeinfo.dong_name }</td>
						<td>${homeinfo.deal_amount }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 맵 마커 띄울 공간 -->
	<div class="row">
		<div class="row align-items-center">
			<div id="map" style="width: 70%; height: 350px; margin: auto;"></div>
		</div>

	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a55445555a66d8b5e8ad74af0600510c&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${homeinfo.lat}, ${homeinfo.lng}), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${homeinfo.lat}, ${homeinfo.lng});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>

	<!-- Footer-->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="/resources/js/main.js"></script>
</body>
</html>
