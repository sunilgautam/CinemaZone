package cinema.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;
import javax.servlet.ServletContext;
import cinema.domain.pojo.Booking;
import cinema.domain.pojo.MovieInfo;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.GrayColor;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class GeneratePDFTicket
{
    private static final SimpleDateFormat dateFormate = new SimpleDateFormat("EEEE dd/MM/yyyy");
    
    public ByteArrayOutputStream generatePDFTicketDocumentBytes(ServletContext context, ResourceBundle resource, Booking booking, MovieInfo movieInfo) throws DocumentException, IOException
    {
	Document document = null;
	ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
	PdfWriter docWriter = null;
	try
	{
	    document = new Document();
	    docWriter = PdfWriter.getInstance(document, baosPDF);
	    
	    // WATERMARK
	    docWriter.setPageEvent(new Watermark(resource.getString("booking.ticket.watermark")));

	    // PAGE SETTINGS
	    document.addAuthor(this.getClass().getName());
	    document.addCreationDate();
	    document.addProducer();
	    document.addCreator(this.getClass().getName());
	    document.addTitle("TICKET");
	    document.setPageSize(PageSize.A4);
	    
	    document.open();
	    
	    Font fontHeader = new Font(FontFamily.COURIER, 14, Font.BOLD, BaseColor.BLACK);
	    Font fontNormal = new Font(FontFamily.COURIER, 12, Font.NORMAL, BaseColor.BLACK);
	    Font fontBig = new Font(FontFamily.COURIER, 13, Font.BOLD, BaseColor.BLACK);
	    Font fontSmall = new Font(FontFamily.COURIER, 6, Font.NORMAL, BaseColor.BLACK);
	    
	    // MAIN TABLE
	    PdfPTable table = new PdfPTable(1);
	    Rectangle rect = new Rectangle(100, 770);
	    table.setWidthPercentage(new float[]{ 80 }, rect);
	    
	    // INITIAL SPACE
	    Paragraph paraBlank = new Paragraph("\n\n\n\n");
	    document.add(paraBlank);
	    PdfPCell cell;
	    
	    // NESTED TOP IMAGE TABLE
	    PdfPTable nestedTopTable = new PdfPTable(2);
	    nestedTopTable.setWidths(new float[]{ 220, 460 });
	    
	    // LOGO
	    Image image = Image.getInstance(context.getRealPath("/images") + "/logo.png");
	    PdfPCell nestedCell;
	    nestedCell = new PdfPCell(image, true);
	    nestedCell.setBorder(Rectangle.NO_BORDER);
	    nestedTopTable.addCell(nestedCell);
	    nestedCell = new PdfPCell();
	    nestedCell.setBorder(Rectangle.NO_BORDER);
	    nestedTopTable.addCell(nestedCell);
	    
	    cell = new PdfPCell();
	    cell.addElement(nestedTopTable);
	    cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	    cell.setPadding(3f);
	    table.addCell(cell);
	    
	    // TICKET DETAIL TABLE
	    PdfPTable nestedDetailTable = new PdfPTable(2);
	    Rectangle rect1 = new Rectangle(100, 770);
	    nestedDetailTable.setWidthPercentage(new float[]{ 50, 50 }, rect1);
	    
	    PdfPCell nestedDetailCell;
	    Paragraph para;
	    
	    // HEADER
	    para = new Paragraph(resource.getString("booking.ticket.ticket"), fontHeader);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setColspan(2);
	    nestedDetailCell.setPadding(7f);
	    nestedDetailCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    //nestedDetailCell.setBackgroundColor(new BaseColor(239, 239, 239));
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // TRANSACTION CODE
	    para = new Paragraph(resource.getString("booking.ticket.transcode"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(booking.getTransaction().getCode(), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // MOVIE NAME
	    para = new Paragraph(resource.getString("booking.details.selection.movie"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(movieInfo.getMovieName() + " " + movieInfo.getCbRating() , fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // SEATS
	    para = new Paragraph(resource.getString("booking.details.selection.seats"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(String.valueOf(booking.getNoOfSeats()), fontNormal);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // DATE & SHOW TIME
	    para = new Paragraph(resource.getString("booking.details.selection.show"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(dateFormate.format(CommonMethod.customeStringToUtilDate(booking.getSchedule().getDate(), "yyyy-MM-dd")) + "    " + booking.getSchedule().getScheduleTime(), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // SCREEN
	    para = new Paragraph(resource.getString("booking.details.selection.screen"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(booking.getSchedule().getScreenName(), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // CLASS & SEATS
	    para = new Paragraph(resource.getString("booking.details.selection.class"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(booking.getSeatType().getSeatType() + " - " + getSeatNames(booking.getSeats()), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // TICKET PRICE
	    para = new Paragraph(resource.getString("booking.details.total.tickets"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(String.valueOf(booking.getTransaction().getAmount()), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell.setHorizontalAlignment(Element.ALIGN_RIGHT);	    
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // CONVENIENCE FEE
	    para = new Paragraph(resource.getString("booking.details.total.conv"), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(String.valueOf(booking.getTransaction().getConvenienceFees()), fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    // GRAND TOTAL
	    para = new Paragraph(resource.getString("booking.details.total.grand"), fontBig);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(String.valueOf(booking.getTransaction().getGrandTotal()), fontBig);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    cell = new PdfPCell();
	    cell.addElement(nestedDetailTable);
	    cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	    table.addCell(cell);
	    
	    // NOTICE
	    Paragraph paraNotice = new Paragraph(resource.getString("booking.ticket.notice"), fontSmall);
	    cell = new PdfPCell(paraNotice);
	    table.addCell(cell);
	    
	    document.add(table);
	}
	catch (DocumentException dex)
	{
	    baosPDF.reset();
	    throw dex;
	}
	finally
	{
	    if (document != null)
	    {
		document.close();
	    }
	    if (docWriter != null)
	    {
		docWriter.close();
	    }
	}
	if (baosPDF.size() < 1)
	{
	    throw new DocumentException("document has " + baosPDF.size() + " bytes");
	}
	return baosPDF;
    }
    
    public String getSeatNames(List<String> seats)
    {
	String seatNames = "";
	for(String item : seats)
	{
	    seatNames += "[" + item.replace(':', '-') + "]";
	}
	return seatNames;
    }
}

class Watermark extends PdfPageEventHelper {
    String strWaterMark;
    Font FONT = new Font(FontFamily.HELVETICA, 52, Font.BOLD, new GrayColor(0.75f));
    
    public Watermark(String strWaterMark)
    {
	this.strWaterMark = strWaterMark;
    }

    public void onEndPage(PdfWriter writer, Document document) {
        ColumnText.showTextAligned(writer.getDirectContentUnder(), Element.ALIGN_TOP, new Phrase(this.strWaterMark, FONT), 150f, 470f, 40);
    }
}