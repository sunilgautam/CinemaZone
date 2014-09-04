package cinema.dbaccess;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public interface DBAccessAPI
{
    public ResultSet executeQueryRS(String query);

    public ResultSet executeQueryRS(Statement stmt);

    public ResultSet executeQueryRS(PreparedStatement pStmt);

    public int executeQuery(String query);

    public int executeQuery(Statement stmt);

    public int executeQuery(PreparedStatement pStmt);

    public ResultSet executeCallRS(String query);

    public ResultSet executeCallRS(CallableStatement cStmt);

    public int executeCall(String query);

    public int executeCall(CallableStatement cStmt);
}
