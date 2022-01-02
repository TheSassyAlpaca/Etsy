<!DOCTYPE html>
<html>
	<html lang="en-US" prefix="og: https://ogp.me/ns#">
	<head>
		<title>Etsy API Test Page</title>
		<meta charset="utf-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	</head>
	
	<body>
		
		<script>
			function getData(data) {
				if (data.ok) {
					console.log(data.status);
					console.log(data);
					apiCallScript(uriComponents.listings,data.results[10].listing_id,"","loadListing");
					apiCallScript(uriComponents.listings,data.results[10].listing_id,"/images","loadListingImages");
				} else {
					alert(data.error);
				}
			}
			/*
			https://www.etsy.com/oauth/connect?
				response_type=code
				&redirect_uri=https://www.example.com/some/location
				&scope=transactions_r%20transactions_w
				&client_id=1aa2bb33c44d55eeeeee6fff&state=superstate
				&code_challenge=DSWlW2Abh-cf8CeLL8-g3hQ2WQyYdKyiu83u_s7nRhI
				&code_challenge_method=S256
			*/
			function loginCallScript(x,y,z,cc) {
				theCall="https://www.etsy.com/oauth/connect?response_type=code&redirect_uri=" + x + "&scope=" + y + "&client_id=" + z + "&state=superstate&code_challenge=" + cc + "&code_challenge_method=S256";
				console.log(theCall);
				$.getScript(theCall);
			}
			
			loginCallScript("https://etsy.thesassyalpaca.com","transactions_r%20transactions_w","imn1bvblrasc7oj8ga5z581x","DSWlW2Abh-cf8CeLL8-g3hQ2WQyYdKyiu83u_s7nRhI");
			
			//"https://openapi.etsy.com/v2/shops/thesassyalpacallc/listings/active.js?callback=getData&api_key=imn1bvblrasc7oj8ga5z581x">
		</script>
	</body>
</html>
