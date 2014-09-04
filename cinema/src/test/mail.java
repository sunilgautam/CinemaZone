package test;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ResourceBundle;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.util.ServletContextAware;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.GrayColor;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
import com.opensymphony.xwork2.ActionSupport;
import cinema.common.BaseAction;
import cinema.template.mail.UserRegistration;
import cinema.util.CommonMethod;
import cinema.util.Constants;
import cinema.util.MailService;

public class mail extends BaseAction implements ServletContextAware
{
    private static final long serialVersionUID = 1L;
    private static final SimpleDateFormat dateFormate = new SimpleDateFormat("EEEE dd/MM/yyyy");
    private ServletContext context;

    @Override
    public String execute() throws Exception
    {
	// UserRegistration template = new UserRegistration();
	// template.setSubject("User Registration");
	// template.setUserName("Sunil Gautam");
	// MailService.getInstance().send(new
	// String[]{"gautam.sunil01@gmail.com","sameerprsd2@gmail.com","gautam.sunil02@yahoo.com"},
	// template);

	// getServletRequestObject().getSession().removeAttribute(SEARCH_HANDLE);
	// MailService2.getInstance().send("gautam.sunil01@gmail.com",
	// generatePDFDocumentBytes().toByteArray(), "application/pdf");
	// return "success";
//	Document document = new Document();
	try
	{
	    HttpServletResponse response = getServletResponseObject();
	    response.setContentType("application/pdf");
//	    PdfWriter.getInstance(document, response.getOutputStream());
//	    document.open();
//	    document.add(new Paragraph("Hello Kiran"));
//	    document.add(new Paragraph(new Date().toString()));
	    
	    System.out.println(this.getTexts("MessageResource"));
	    
	    generatePDFDocumentBytes(response, this.getTexts("MessageResource"));
	}
	catch (Exception e)
	{
	    e.printStackTrace();
	}
//	document.close();
	return null;
    }

    // public void SMS() {
    // com.way2sms.SMS smsClient=new com.way2sms.SMS();
    // smsClient.send("9820850847", "6186", "9820850847", "TESTING MESSAGE",
    // "");
    // }

    protected ByteArrayOutputStream generatePDFDocumentBytes1() throws DocumentException
    {
	Document doc = new Document();

	ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
	PdfWriter docWriter = null;

	try
	{
	    docWriter = PdfWriter.getInstance(doc, baosPDF);

	    doc.addAuthor(this.getClass().getName());
	    doc.addCreationDate();
	    doc.addProducer();
	    doc.addCreator(this.getClass().getName());
	    doc.addTitle("This is a title.");
	    doc.addKeywords("pdf, itext, Java, open source, http");

	    doc.setPageSize(PageSize.LETTER);

	    doc.open();

	    doc.add(new Paragraph("This document was created by a class named: " + this.getClass().getName()));

	    doc.add(new Paragraph("This document was created on " + new java.util.Date()));

	    doc.add(new Paragraph("This is a multi-page document."));
	}
	catch (DocumentException dex)
	{
	    baosPDF.reset();
	    throw dex;
	}
	finally
	{
	    if (doc != null)
	    {
		doc.close();
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
    
    protected ByteArrayOutputStream generatePDFDocumentBytes(HttpServletResponse response, ResourceBundle resource) throws DocumentException, IOException
    {
	Document document = null;
	ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
	PdfWriter docWriter = null;
	try
	{
	    document = new Document();
	    docWriter = PdfWriter.getInstance(document, response.getOutputStream());
	    docWriter.setPageEvent(new Watermark("WATER MARK"));

	    document.addAuthor(this.getClass().getName());
	    document.addCreationDate();
	    document.addProducer();
	    document.addCreator(this.getClass().getName());
	    document.addTitle("TICKET");

	    document.setPageSize(PageSize.A4);
	    //doc.setMargins(0, 0, 0, 0);
	    document.open();
	    
	    PdfPTable table = new PdfPTable(1);
	    Rectangle rect = new Rectangle(100, 770);
	    table.setWidthPercentage(new float[]{ 80 }, rect);
	    
	    Paragraph paraBlank = new Paragraph("\n\n\n\n");
	    document.add(paraBlank);
	    PdfPCell cell;
	    
	    Font fontHeader = new Font(FontFamily.COURIER, 14, Font.BOLD, BaseColor.BLACK);
	    Font fontNormal = new Font(FontFamily.COURIER, 12, Font.NORMAL, BaseColor.BLACK);
	    Font fontBig = new Font(FontFamily.COURIER, 13, Font.BOLD, BaseColor.BLACK);
	    Font fontSmall = new Font(FontFamily.COURIER, 6, Font.NORMAL, BaseColor.BLACK);
	    
	    // NESTED TOP IMAGE TABLE
	    PdfPTable nestedTopTable = new PdfPTable(2);
	    nestedTopTable.setWidths(new float[]{ 220, 460 });
	    String filePath = this.context.getRealPath("/images");
	    System.out.println(filePath);
	    Image image = Image.getInstance(filePath + "/logo.png");
	    PdfPCell nestedCell;
	    nestedCell = new PdfPCell(image, true);
	    nestedCell.setBorder(Rectangle.NO_BORDER);
	    nestedTopTable.addCell(nestedCell);
	    nestedCell = new PdfPCell();
	    nestedCell.setBorder(Rectangle.NO_BORDER);
	    nestedTopTable.addCell(nestedCell);
	    //
	    cell = new PdfPCell();
	    cell.addElement(nestedTopTable);
	    cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	    cell.setPadding(3f);
	    table.addCell(cell);
	    
	    // NESTED DETAIL TABLE
	    PdfPTable nestedDetailTable = new PdfPTable(2);
	    Rectangle rect1 = new Rectangle(100, 770);
	    nestedDetailTable.setWidthPercentage(new float[]{ 50, 50 }, rect1);
	    
	    PdfPCell nestedDetailCell;
	    Paragraph para;
	    para = new Paragraph(resource.getString("booking.ticket.ticket"), fontHeader);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setColspan(2);
	    nestedDetailCell.setPadding(7f);
	    nestedDetailCell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    //nestedDetailCell.setBackgroundColor(new BaseColor(239, 239, 239));
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Transaction code :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("T0120121129194937163", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Movie :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("Bol Bachchan U/A", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Seat(s) :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("2", fontNormal);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Date & show time :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph(dateFormate.format(CommonMethod.customeStringToUtilDate("2012-11-29 19:22:16.310", "yyyy-MM-dd")) + " 12:15PM", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Screen :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("Screen1", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Class & seat(s) :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("Platinum - [G-1][G-2]", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Ticket price :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("700.0", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell.setHorizontalAlignment(Element.ALIGN_RIGHT);	    
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Convenience fee :", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("20.0", fontNormal);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    nestedDetailTable.addCell(nestedDetailCell);
	    
	    para = new Paragraph("Grand total :", fontBig);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailTable.addCell(nestedDetailCell);
	    para = new Paragraph("720.0", fontBig);
	    nestedDetailCell = new PdfPCell(para);
	    nestedDetailCell.setPadding(5f);
	    nestedDetailCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    nestedDetailTable.addCell(nestedDetailCell);
	    //
	    cell = new PdfPCell();
	    cell.addElement(nestedDetailTable);
	    cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	    table.addCell(cell);
	    
	    Paragraph paraNotice = new Paragraph("** Notice : this is notice. " + this.context.getInitParameter("domain"), fontSmall);
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

//	if (baosPDF.size() < 1)
//	{
//	    throw new DocumentException("document has " + baosPDF.size() + " bytes");
//	}
	return baosPDF;
    }

    @Override
    public void setServletContext(ServletContext context)
    {
	this.context = context;
    }

    public ServletContext getContext()
    {
	return context;
    }

    public void setContext(ServletContext context)
    {
	this.context = context;
    }
}

class Watermark extends PdfPageEventHelper {
    
    String MARK;
    public Watermark(String MARK)
    {
	this.MARK = MARK;
    }
    
    Font FONT = new Font(FontFamily.HELVETICA, 52, Font.BOLD, new GrayColor(0.75f));

    public void onEndPage(PdfWriter writer, Document document) {
        ColumnText.showTextAligned(writer.getDirectContentUnder(), Element.ALIGN_TOP, new Phrase(this.MARK, FONT), 150f, 470f, 40);
    }
}
