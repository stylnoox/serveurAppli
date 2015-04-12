package fr.dauphineIM;

import java.io.IOException;

import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/echoall")
public class EndPoint
{

	@OnMessage
	// Message received
	public void onMessage(Session session, String msg)
	{
		try
		{
			for (Session sess : session.getOpenSessions())
			{
				if (sess.isOpen())
					sess.getBasicRemote().sendText(msg);
			}
		} catch (IOException e)
		{
		}
	}

	@OnOpen
	// Connection opened
	public void open(Session session, EndpointConfig conf)
	{
	}

	// private final Logger log = Logger.getLogger(getClass().getName());
	// //@ServerEndpoint(value = "/chat/{room}", encoders =
	// MessageEncoder.class, decoders = MessageDecoder.class)
	// @OnOpen
	// public void onOpen(final Session session, @PathParam("room") final String
	// room) {
	// //log.info("session openend and bound to room: " + room);
	// session.getUserProperties().put("room", room);
	// }
	//
	// @OnMessage
	// public void onMessage(final Session session, final Message chatMessage) {
	// String room = (String) session.getUserProperties().get("room");
	// try {
	// for (Session s : session.getOpenSessions()) {
	// if (s.isOpen()
	// && room.equals(s.getUserProperties().get("room"))) {
	// s.getBasicRemote().sendObject(chatMessage);
	// }
	// }
	// } catch (IOException | EncodeException e) {
	// //log.log(Level.WARNING, "onMessage failed", e);
	// }
	// }
}