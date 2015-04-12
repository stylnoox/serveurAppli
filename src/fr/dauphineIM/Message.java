package fr.dauphineIM;

import java.util.Date;

public class Message
{
	private String message;
	private String emetteur;
	private Date recu;

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getEmetteur()
	{
		return emetteur;
	}

	public void setEmetteur(String emetteur)
	{
		this.emetteur = emetteur;
	}

	public Date getRecu()
	{
		return recu;
	}

	public void setRecu(Date recu)
	{
		this.recu = recu;
	}

}