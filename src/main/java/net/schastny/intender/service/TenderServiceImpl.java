package net.schastny.intender.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import net.schastny.intender.dao.TenderDAO;
import net.schastny.intender.doc2pdf.PdfMaker;
import net.schastny.intender.domain.Tender;

@Service
public class TenderServiceImpl implements TenderService {

	private static final  org.apache.log4j.Logger log =  org.apache.log4j.Logger.getLogger(TenderServiceImpl.class);
	
    @Autowired
    private TenderDAO tenderDAO;
    
	@Autowired
	private ServletContext servletContext;
	
	// To store docs in <web-app-home>/resources/docs/
	private final String DOCS_PATH = servletContext.getRealPath("/")+"/resources/docs/";
	// To store outside <web-app-home>
//	private final String DOCS_PATH = System.getProperty("catalina.base")+"/uploads/";
	
	
    @Transactional
    public void storeTender(Tender tender) {
    	this.storeFileSystem(tender);
    	tenderDAO.storeTender(tender);
    }

    @Transactional
	public void deleteTender(Integer id) {
    	this.deleteFileSystem(id);
		tenderDAO.deleteTender(id);
	}
    
    @Transactional
    public List<Tender> showInDivision(Integer divId, int numTenders) {
    	return tenderDAO.selectInDivision(divId, numTenders);
    }

    @Transactional
    public List<Tender> showAllInDivision(Integer divId) {
    	return tenderDAO.selectAllInDivision(divId);
    }

    @Transactional
	public Tender showTender(Integer id) {
		return tenderDAO.selectTender(id);
	}
    
    private void storeFileSystem(Tender tender){
    	CommonsMultipartFile attachedDoc = tender.getAttachedDoc();
    	if (!attachedDoc.isEmpty()){
			// store the bytes somewhere
			String fileName = Long.toString(System.nanoTime());
			try {
				File uploadDir = new File(DOCS_PATH);
				uploadDir.mkdir();
				// Delete old file
				File oldFile = new File(uploadDir, tender.getAttachedDocName()+".docx");
				oldFile.delete();
				// Write newly uploaded file
				File destinationFile = new File(uploadDir, fileName+".docx");
				attachedDoc.transferTo(destinationFile);
			} catch (Exception e) {
				log.error(e);
			}
			// !store the bytes somewhere
			
			// Make pdf
//			makePdf(fileName);
			
			// Update attachedDocName field
			tender.setAttachedDocName(fileName);
		}
    }
    
    private void deleteFileSystem(Integer id){
		Tender tender = this.showTender(id);
		File uploadDir = new File(DOCS_PATH);
		uploadDir.mkdir();
		File destinationFileDOCX = new File(uploadDir, tender.getAttachedDocName()+".docx");
		destinationFileDOCX.delete();
		File destinationFilePDF = new File(uploadDir, tender.getAttachedDocName()+".pdf");
		destinationFilePDF.delete();
    }
    
    private void makePdf(String fileName){
		PdfMaker maker = new PdfMaker(servletContext.getRealPath("/")+"/resources/docs/");
		try {
			maker.make(fileName);
		} catch (Exception e) {
			log.error(e);
		}
    }
}
