package cinema.exception;

public class DriverClassNotFound extends GenericException
{
    private static final long serialVersionUID = 1L;

    public DriverClassNotFound(String reason)
    {
	super(reason);
    }
}
