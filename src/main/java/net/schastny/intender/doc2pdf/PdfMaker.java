package net.schastny.intender.doc2pdf;

import java.io.File;
import java.io.OutputStream;

import org.docx4j.fonts.IdentityPlusMapper;
import org.docx4j.fonts.Mapper;
import org.docx4j.fonts.PhysicalFont;
import org.docx4j.fonts.PhysicalFonts;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;

public class PdfMaker {
	
	private static final  org.apache.log4j.Logger log =  org.apache.log4j.Logger.getLogger(PdfMaker.class);
	
	private String convertDirPath;
	
	public PdfMaker(String convertDirPath){
		this.convertDirPath = convertDirPath;
	}
	
	// ToDo Не хочет сохранять изображения
	public void make(String inputFile) throws Exception{
		String inputFilePath = convertDirPath + inputFile + ".docx";
		String outputFilePath = convertDirPath + inputFile + ".pdf";

		WordprocessingMLPackage wordMLPackage;
		wordMLPackage = WordprocessingMLPackage.load(new File(inputFilePath));
		
		// Set up font mapper
		Mapper fontMapper = new IdentityPlusMapper();
		wordMLPackage.setFontMapper(fontMapper);
		
		// Example of mapping missing font Algerian to installed font Comic Sans MS
		PhysicalFont fontDefault = PhysicalFonts.getPhysicalFonts().get("Times New Roman");
		fontMapper.getFontMappings().put("Algerian", fontDefault);
		
		org.docx4j.convert.out.pdf.PdfConversion c = 
			new net.schastny.intender.doc2pdf.Conversion(wordMLPackage);

		OutputStream os = new java.io.FileOutputStream(outputFilePath);
		c.output(os);
		
		log.debug("Saved " + outputFilePath);
	}

	public static void main(String[] args) {
		PdfMaker maker = new PdfMaker(System.getProperty("user.dir") + "/tmp/");
		try {
			maker.make("test2");
		} catch (Exception e) {
			log.error(e);
		}
	}
}