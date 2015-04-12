package fr.dauphineIM;

import javax.json.Json;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

public class MessageEncoder implements Encoder.Text<Message>
{
	@Override
	public void init(final EndpointConfig config)
	{
	}

	@Override
	public void destroy()
	{
	}

	@Override
	public String encode(final Message chatMessage) throws EncodeException
	{
		return Json.createObjectBuilder()
				.add("message", chatMessage.getMessage())
				.add("emetteur", chatMessage.getEmetteur())
				.add("recu", chatMessage.getRecu().toString()).build()
				.toString();
	}
}