package fr.dauphineIM;

import java.io.StringReader;
import java.util.Date;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

public class MessageDecoder implements Decoder.Text<Message>
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
	public Message decode(final String textMessage) throws DecodeException
	{
		Message msg = new Message();
		JsonObject obj = Json.createReader(new StringReader(textMessage))
				.readObject();
		msg.setMessage(obj.getString("message"));
		msg.setEmetteur(obj.getString("sender"));
		msg.setRecu(new Date());
		return msg;
	}

	@Override
	public boolean willDecode(final String s)
	{
		return true;
	}
}

