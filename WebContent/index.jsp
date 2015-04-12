<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Java EE 7 Dauphine</title>
<meta name="author" content="HAN-JOLY">

<!-- JQuery -->
<script src="resource/js/jquery-1.10.2.min.js"></script>

<!-- Les styles -->



<!-- Le code JQuery -->
<script>
	var $pseudo = '';
	var $room = '';

	$(document).ready(function() {
		$pseudo = $('#pseudo');
		$room = $('#room');
		$vmessage = $('#vmessage');

		$('.salle').hide();

		$('#getout').click(function() {
			$('.accueil').show();
			$('.salle').hide();
		});

		$('#enter').click(function() {
			$('.accueil').hide();
			$('.salle').show();
			$('.salle h2').text('Chat # ' + $pseudo.val() + "@" + $room.val());
			$('.vmessage').focus();
		});

	});
</script>

</head>


<body>
	<!-- Accueil -->
	<div class="accueil">
		<div>
			<!-- <form action="/ma-page-de-traitement" method="post"> -->
			<div>
				<label for="pseudonyme">Pseudonyme :</label> <input class="pseudo"
					type="text" id="pseudo" />
			</div>
			<div>
				Salons <select class="roomSelect" name="roomSelect" id="room">
					<option value="salle1">Salle 1</option>
					<option value="salle2">Salle 2</option>
					<option value="salle3">Salle 3</option>
				</select>
			</div>
			<button class="enter" type="submit" id="enter">enter</button>

			<!-- </form> -->
		</div>
	</div>


	<div class="salle">
		<!-- Salle -->
		<h2 class="pseudoRoomDisplay"></h2>
		<div>
			<label for="composantvide">Composant vide</label>
			<!-- 			<output type="text" id="composantvide" /> -->

		</div>


		<div class="chat">
			<div>
				<label for="vmessage">Votre message :</label> <input type="text"
					id="vmessage" />
			</div>
			<div>

				<input class="sendMsg" type="submit" value="Envoyer message">

				<input type="submit" value="Sortir" id="getout">
			</div>
		</div>
	</div>
</body>
</html>
