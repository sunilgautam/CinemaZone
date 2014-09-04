package cinema.domain.pojo;

import java.util.ArrayList;
import java.util.List;

public class SeatRow
{
    private String no;
    private List<SeatCell> cells = new ArrayList<SeatCell>();

    public SeatRow()
    {

    }

    public SeatRow(String no, List<SeatCell> cells)
    {
	this.no = no;
	this.cells = cells;
    }

    public String getNo()
    {
	return no;
    }

    public void setNo(String no)
    {
	this.no = no;
    }

    public List<SeatCell> getCells()
    {
	return cells;
    }

    public void setCells(List<SeatCell> cells)
    {
	this.cells = cells;
    }
}
