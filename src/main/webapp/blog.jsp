<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Document</title>
<link
	href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./assets/css/blog.css" />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main>
		<div class="blog_cart">
			<div class="center">
				<p>
					Plants or Humans, <br /> No one grows without <br /> <span>
						Love & Care!</span>
				</p>
				<button id="add_blog">Add your own Blog</button>
			</div>
			<form>
				<div class="blog_content">
					<label for="img">img<input type="text"
						placeholder="Add a img link(ex:https://..)" id="upload_img" /></label><br />

					<div class="title_input">
						<h4 id="title_name">Title</h4>
						<textarea placeholder="Add a Title.." id="title"></textarea>
					</div>
					<div class="content_input">
						<h4 id="content_name">Content</h4>
						<textarea placeholder="Add a content.." id="content"></textarea>
					</div>
					<button id="add">Want to add on more points</button>

					<div class="additional_points">
						<div class="title_input_2">
							<h4 id="heading_1_input">heading_1</h4>

							<textarea placeholder="Add a heading." id="points"></textarea>
						</div>

						<div class="content_2">
							<h4 id="extra_points_input">extra_content</h4>

							<textarea placeholder="Add on points.." id="extra_points"></textarea>
						</div>
						<div class="heading_2">
							<h4 id="heading_2_input">heading_2</h4>

							<textarea placeholder="Add a heading.." id="heading_2"></textarea>
						</div>
						<div class="content_3">
							<h4 id="extra_content_2_input">extra_content_2</h4>

							<textarea placeholder="Add some more points.."
								id="extra_content_2"></textarea>
						</div>
					</div>
					<button id="submit" type="submit">Submit</button>
				</div>
			</form>
		</div>

		<div class="blog_view"></div>
	</main>
	<script src="./assets/js/blog.js"></script>
</body>
</html>
