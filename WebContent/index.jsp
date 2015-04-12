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
	var $message;
	var websocket;
	
	var $nickName;
	var $chatWindow;

	function onMessageReceived(evt)
	{
		var msg = JSON.parse(evt.data); // message JSon -> objet JavaScript
		var $messageLine = $('<tr><td class="received">' + msg.recu
				+ '</td><td class="user label label-info">' + msg.emetteur
				+ '</td><td class="message badge">' + msg.message
				+ '</td></tr>');
		$chatWindow.append($messageLine);
	}

	function sendMessage()
	{
		var msg = '{"message":"' + $message.val() + '", "emetteur":"'
				+ $pseudo.val() + '", "recu":""}';
		websocket.send(msg);
		$message.val('').focus();
	}

	function connectToChatserver()
	{
		room = $('#room option:selected').val();
		websocket = new WebSocket(serviceLocation + room);
		websocket.onmessage = onMessageReceived;
	}

	function leaveRoom()
	{
		websocket.close();
		$chatWindow.empty();
		$('.salle').hide();
		$('.accueil').show();
		$pseudo.focus();
	}

	$(document).ready(function()
	{
		$pseudo = $('#pseudo');
		$room = $('#room');
		$vmessage = $('#vmessage');

		$('.salle').hide();

		$('#getout').click(function()
		{
			$('.accueil').show();
			$('.salle').hide();
		});

		$('#enter').click(function()
		{
			$('.accueil').hide();
			$('.salle').show();
			$('.salle h3').text('Chat # ' + $pseudo.val() + "@" + $room.val());
			$('.vmessage').focus();
		});

	});
</script>

</head>


<body>
	<!-- Accueil | Page de connexion -->
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
		<!-- Salle | Page de communication -->
		<h3 class="pseudoRoomDisplay"></h3>
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
