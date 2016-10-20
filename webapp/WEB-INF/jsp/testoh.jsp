<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.pojoro  {
	background: rgba( 255, 255, 255, 1);
	background: radial-gradient(ellipse at center, rgba(255,255,255,1) 40%,rgba(51,51,51,1) 100%);
	border-radius: 100%;

	/* box-shadow: secondary color, body, eyelash */

	box-shadow: 0 0 0 0.2em rgb(146,89,149),
				0 0 0.1em 0.55em rgb(176,89,179),
				inset 0 0.2em 0 0 rgb(136,79,139);

	/* ojo (eye) */

	color: rgba( 40, 40, 40, 0.8);
	line-height: 1.1em;
	padding-left: 0.18em;
	-webkit-font-smoothing: antialiased;
	user-select: none;

	/* usability, position and transition */

	cursor: pointer;
	position: relative;
	margin: 5em auto 0 auto;
	width: 1em; height: 1em;
	transform-origin: center;
	transition: all 0.8s ease-in-out;

	/* Separate the animations to have a better control over the eye and the body */

	animation: eye 2.2s ease-in-out infinite, body 1.15s 1.8s linear infinite;
}

/* Elevate and distort the creature. */

.pojoro:hover  {
	transform: scaleY(0.9) scaleX(0.95) translateY(-3em) translateZ(0);
}

/* wings */

.pojoro:before,
.pojoro:after  {
	background: rgba(0,0,0,0);
	border-radius: 100%;
	content: "";

	/* display:none, hide wings */

	display: none;
	position: absolute;
	width: 1em; height: 0.1em;
	-webkit-filter: blur(1px);
	transition: all 0.2s;
	animation-duration: 0.2s;
	animation-iteration-count: infinite;
	animation-timing-function: ease-in-out;
}

.pojoro:before  {
	top: 25%; left: 1.45em;
	margin-left: -1em;
	transform-origin: left;
	transform: rotate(-60deg);
	animation-name: wings;
}

.pojoro:after  {
	top: 25%; left: -2.2em;
	margin-left: 1em;
	transform-origin: right;
	transform: rotate(60deg);
	animation-name: wings2;
}

.pojoro:hover:before,
.pojoro:hover:after  {
	background: rgba(100,100,100,0.8);

	/* display:block, we allow the wings to appear and the animation starts */

	display: block;
	margin-left: 0em;
	width: 2em; height: 0.3em;
}

@keyframes eye  {

	/* Eye movement */

	5%, 10%  {
		line-height: 1.2em;
		padding-left: 0em;
	}
	15%, 20%  {
		line-height: 1.15em;
		padding-left: 0.4em;
	}

	/* Eyelash movement */

	25%  {
		box-shadow: 0 0 0 0.2em rgb(146,89,149),
					0 0 0.1em 0.55em rgb(166,89,169),
					inset 0 1em 0 0 rgb(136,79,139);
	}
	23%, 27%  {
		box-shadow: 0 0 0 0.2em rgb(146,89,149),
					0 0 0.1em 0.55em rgb(166,89,169),
					inset 0 0.2em 0 0 rgb(136,79,139);
	}
}

@keyframes body  {
	50%  {
		width: 1.4em; height: 1.4em;
	}
}

@keyframes wings  {
	50%  {
		transform: rotate(65deg);
	}
}

@keyframes wings2  {
	50%  {
		transform: rotate(-65deg);
	}
}

</style>
<title>Rounded Animated Navigation | CodyHouse</title>
</head>
<body>
<div class="pojoro">●</div>
</body>
</html>