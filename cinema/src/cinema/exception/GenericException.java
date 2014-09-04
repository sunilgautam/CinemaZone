package cinema.exception;

public class GenericException extends Exception
{
    private static final long serialVersionUID = 1L;
    protected Throwable cause;

    public GenericException()
    {
	super();
    }

    public GenericException(String reason)
    {
	super(reason);
    }

    public GenericException(String reason, Throwable cause)
    {
	super(reason);
	this.cause = cause;
    }

    @Override
    public Throwable getCause()
    {
	return (this.cause);
    }
}