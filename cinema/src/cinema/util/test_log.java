package cinema.util;

import org.apache.log4j.Logger;

public class test_log
{
    private static final Logger logger = Logger.getLogger(test_log.class);

    public test_log(String str)
    {
	logger.warn("<==========IN THE LOG { " + str + " }==============>");
    }
}
