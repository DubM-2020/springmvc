<%@include file="header.jsp"%>

<div class="super_container">

	<!-- Header -->
	<header class="header">
		<div class="header_content d-flex flex-row align-items-center justify-content-center">
			<div class="logo"><a href="#">Mixtape</a></div>
			<div class="log_reg">
				<ul class="d-flex flex-row align-items-start justify-content-start">
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
				</ul>
			</div>
			<nav class="main_nav">
				<ul class="d-flex flex-row align-items-start justify-content-start">
					<li><a href="home.jsp">Home</a></li>
					<li><a href="about.jsp">About us</a></li>
					<li><a href="music.html">Music</a></li>
					<li class="active"><a href="blog.jsp">News</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</nav>
			<div class="hamburger ml-auto">
				<div class="d-flex flex-column align-items-end justify-content-between">
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
	</header>

	<!-- Menu -->

	<div class="menu">
		<div>
			<div class="menu_overlay"></div>
			<div class="menu_container d-flex flex-column align-items-start justify-content-center">
				<div class="menu_log_reg">
					<ul class="d-flex flex-row align-items-start justify-content-start">
						<li><a href="#">Login</a></li>
						<li><a href="#">Register</a></li>
					</ul>
				</div>
				<nav class="menu_nav">
					<ul class="d-flex flex-column align-items-start justify-content-start">
						<li><a href="home.jsp">Home</a></li>
						<li><a href="about.jsp">About us</a></li>
						<li><a href="music.html">Music</a></li>
						<li><a href="blog.jsp">News</a></li>
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- Home -->

	<div class="home">
		<div class="home_inner">
			<!-- Image artist: https://unsplash.com/@yoannboyer -->
			<div class="parallax_background parallax-window" data-parallax="scroll" data-image-src="images/blog.jpg" data-speed="0.8"></div>
			<div class="home_container">
				<div class="home_content text-center">
					<div class="home_subtitle">Just us</div>
					<div class="home_title">The Blog</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Blog -->

	<div class="blog">
		<div class="container">
			<div class="row">

				<!-- Blog Posts -->
				<div class="col-lg-9">
					<div class="blog_posts">

						<!-- Blog Post -->

						<!-- Blog Post -->
						<div class="blog_post blog_post_audio">
							<div class="blog_post_date d-flex flex-column align-items-center justify-content-center">
								<div>July</div>
								<div>26</div>
								<div>2018</div>
							</div>

							<!-- Single Player -->
							<div class="single_player_container d-flex flex-column align-items-start justify-content-center">
								<div class="single_player">
									<div id="jplayer_1" class="jp-jplayer"></div>
									<div id="jp_container_1" class="jp-audio" role="application" aria-label="media player">
										<div class="jp-type-single">
											<div class="player_details d-flex flex-row align-items-center justify-content-start">
												<div class="jp-details">
													<div>playing</div>
													<div class="jp-title" aria-label="title">&nbsp;</div>
												</div>
												<div class="jp-controls-holder ml-auto">
													<button class="jp-play" tabindex="0"></button>
												</div>
											</div>
											<div class="player_controls">
												<div class="jp-gui jp-interface d-flex flex-row align-items-center justify-content-start">
													<div class="jp-controls-holder time_controls d-flex flex-row align-items-center justify-content-start">
														<div><div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div></div>
														<div class="jp-progress">
															<div class="jp-seek-bar">
																<div class="jp-play-bar"></div>
															</div>
														</div>
														<div><div class="jp-duration ml-auto" role="timer" aria-label="duration">&nbsp;</div></div>
													</div>
													<div class="jp-volume-controls d-flex flex-row align-items-center justify-content-start ml-auto">
														<button class="jp-mute" tabindex="0"></button>
														<div class="jp-volume-bar">
															<div class="jp-volume-bar-value"></div>
														</div>
													</div>
												</div>
											</div>
											<div class="jp-no-solution">
												<span>Update Required</span>
												To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>
											</div>
										</div>
									</div>

								</div>
							</div>

						</div>

						<!-- Blog Post -->


					</div>
				</div>

				<!-- Sidebar -->
				<div class="col-lg-3">
					<div class="sidebar">

						<div class="sidebar_section">
							<div class="sidebar_title">Latest News</div>
							<div class="latest_news_list">

								<!-- Latest News -->
								<div class="latest_news d-flex flex-row align-items-start justify-content-start">
									<div class="latest_news_image"><img src="/resources/static/img/latest_1.jpg" alt="https://unsplash.com/@dannykekspro"></div>
									<div class="latest_news_content">
										<div class="latest_news_date"><a href="#">July 26, 2018</a></div>
										<div class="latest_news_title"><a href="#">How to get the best playlist</a></div>
									</div>
								</div>

								<!-- Latest News -->
								<div class="latest_news d-flex flex-row align-items-start justify-content-start">
									<div class="latest_news_image"><img src="/resources/static/img/latest_2.jpg" alt="https://unsplash.com/@rexcuando"></div>
									<div class="latest_news_content">
										<div class="latest_news_date"><a href="#">July 26, 2018</a></div>
										<div class="latest_news_title"><a href="#">How to get the best playlist</a></div>
									</div>
								</div>

								<!-- Latest News -->
								<div class="latest_news d-flex flex-row align-items-start justify-content-start">
									<div class="latest_news_image"><img src="/resources/static/img/latest_3.jpg" alt="https://unsplash.com/@arstyy"></div>
									<div class="latest_news_content">
										<div class="latest_news_date"><a href="#">July 26, 2018</a></div>
										<div class="latest_news_title"><a href="#">How to get the best playlist</a></div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

</div>

<%@include file="footer.jsp"%>