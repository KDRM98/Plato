<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="reset.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans"
	rel="stylesheet">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Bar</title>
<style>
.searchText {
	text-align: center;
	font-size: 80px;
	color: white;
	font-family: 'Black Han Sans', sans-serif;
}

.searchBar {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: flex-start;
	background: white;
	box-sizing: content-box;
	padding: 5px 10px;
	border-radius: 30px;
	font-family: Roboto;
	line-height: 50px;
	width: 50vw;
	margin: 1vh auto 10vh;
	cursor: pointer;
	transition: 0.1s all;
	border: 1px solid #000;
}

.searchBar .fa {
	margin-right: 8px;
	font-size: 30px;
}

.searchBar input[name=search] {
	padding: 10px 0;
	border: 1px solid transparent;
	font-size: 16px;
	border-radius: 30px;
	background: transparent;
	margin-left: 5px;
}

.searchBar .tag {
	background: #C5FAD5;
	margin: 5px 5px;
	color: white;
	padding: 0px 10px;
	border-radius: 30px;
	cursor: pointer;
}

.searchBar .tag:hover {
	background: #83FFA9;
}

.searchBar .tag .remove:before {
	content: "×";
	padding-left: 15px;
}

.searchBar input[name=search] {
	padding: 10px;
	border: 1px solid transparent;
	font-size: 16px;
	border-radius: 30px;
	background: transparent;
}

.background {
	display: flex;
	align-items: center;
	justify-content: center;
	background-image: url('../image/mainpage-background.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	width: 100%;
	height: 60vh;
}

.searchText-Bar {
	text-align: center;
}

.searchBar {
	margin: 0 auto;
}
</style>

</head>
<body>
	<div class="background">
		<div class="searchText-Bar">
			<div class="searchText">레시피 찾기</div>

			<div class="searchBar">
				<span class="fa fa-search"></span> <input type="text" name="search"
					placeholder="" size="1">
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
	<script>
		let filter = [];

		$(".searchBar").on("click", function() {
			$(this).find("input").focus();
		});

		$("input").on("keyup", function() {
			var val = $(this).val().length;
			if (!val)
				$(this).attr("size", 1);
			else
				$(this).attr("size", val);
		});
		$.fn.extend({
			animateCss : function(animationName, callback) {
				var animationEnd = (function(el) {
					var animations = {
						animation : "animationend",
						OAnimation : "oAnimationEnd",
						MozAnimation : "mozAnimationEnd",
						WebkitAnimation : "webkitAnimationEnd"
					};

					for ( var t in animations) {
						if (el.style[t] !== undefined) {
							return animations[t];
						}
					}
				})(document.createElement("div"));

				this.addClass("animated " + animationName).one(animationEnd,
						function() {
							$(this).removeClass("animated " + animationName);

							if (typeof callback === "function")
								callback();
						});

				return this;
			}
		});

		$("input")
				.on(
						"keydown",
						function(event) {
							if (event.which === 32) {
								event.preventDefault();
								val = $(this).val().replace(/ /g, "").replace(
										/[^\w\s가-힣]/gi, "").replace(/[_\s]/g,
										"-").toLowerCase();
								if (val == "")
									return false;

								if (!filter.includes(val)) {
									filter.push(val);
									$(
											'<span class="tag">'
													+ val
													+ '<span class="remove"></span></span>')
											.insertBefore(
													'input[name="search"]');
									$(this).val("");
								} else {
									$(".tag")
											.each(
													function() {
														if ($(this).text() == val) {
															$(this)
																	.addClass(
																			"animated bounce");
															alert("중복된 재료입니다. 다시 시도 해주세요.");
														}
													});
								}
							}

						});

		$("input").on("keydown", function(event) {
			if (event.which == 8 && "" == $(this).val()) {
				var touch = $(this).prev();
				var text = touch.text();
				filter.remove(text);
				$(".tag").each(function() {
					var $this = $(this);
					if ($this.text().toLowerCase() == text.toLowerCase())
						$this.remove();
				});
				touch.last().remove();
			}

		});

		$("body").on("click", ".tag", function() {
			var text = $(this).text().slice(0, -1);
			filter.remove(text);
			$(this).remove();

			showFilter();
		});

		Array.prototype.remove = function() {
			var what, a = arguments, L = a.length, ax;
			while (L && this.length) {
				what = a[--L];
				while ((ax = this.indexOf(what)) !== -1) {
					this.splice(ax, 1);
				}
			}
			return this;
		};
	</script>
</body>
</html>
