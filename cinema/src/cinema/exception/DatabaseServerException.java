package cinema.exception;

public class DatabaseServerException extends GenericException
{
    private static final long serialVersionUID = 1L;

    public DatabaseServerException(String reason, Throwable cause)
    {
	super(reason, cause);
    }
}