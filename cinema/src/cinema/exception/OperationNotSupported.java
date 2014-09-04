package cinema.exception;

public class OperationNotSupported extends GenericException
{

    private static final long serialVersionUID = 1L;

    public OperationNotSupported(String reason)
    {
	super(reason);
    }
}