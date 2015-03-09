/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package dwz.present.content;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import javax.servlet.ServletException;

import dwz.business.content.ContentException;
import dwz.business.content.ContentManager;
import dwz.business.content.FileInfo;
import dwz.business.content.Folder;
import dwz.constants.BeanManagerKey;
import dwz.framework.config.Configuration;
import dwz.framework.core.factory.BusinessFactory;
import dwz.present.BaseAction;

public class ContentAction extends BaseAction {
	private File	file;

	private String	fileId;
	private String	fileName;
	private String	folderId;

	private String	basePath	= "";

	private String	description;
	
	private String furl;


	public String getFurl() {
		return furl;
	}

	public void setFurl(String furl) {
		this.furl = furl;
	}

	public String saveContent() throws IOException, ServletException {

		Configuration config = BusinessFactory.getFactory()
				.retrieveConfiguration();
		String basePath = config.getStaticPagePath() + this.getBasePath();
         
		System.out.println("basePath: " + basePath);
		String content = this.getDescription();
		String fileName = this.getFileName();

		java.io.File baseDir = new java.io.File(basePath);
		if (!baseDir.exists()) {
			baseDir.mkdirs();
		}
		
		furl += folderId;

		String realPath = baseDir + "/" + fileName;

		java.io.File file = new java.io.File(realPath);
		if (file.exists()) {
			file.delete();
		}

		file.createNewFile();

		OutputStreamWriter out = null;
		try {
			out = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
			out.write(content.trim());
			out.flush();

			return ajaxForwardSuccess(getText("msg.operation.success"));
		} catch (IOException e) {
			log.error(e);
			return ajaxForwardError(getText("msg.operation.failure"));
		} finally {
			if (out != null) {
				out.close();
				out = null;
			}
		}
	}

	public String upload() {

		ContentManager contentManager = BusinessFactory.getFactory()
				.getManager(BeanManagerKey.contentManager);

		// if (file.getFileSize() > (1024 * 200) ){
		// request.setAttribute("statusCode", 300);
		// request.setAttribute("message", "Please note that the size limit of
		// each uploaded file is 200KB");
		//			
		// return this.callbackForward();
		// }
		try {
			Folder folder = contentManager.getFolder(folderId);
			FileInfo fileInfo = contentManager.uploadFile(new FileInputStream(
					file), file.getName(), folder);

		} catch (ContentException e) {
			return ajaxForwardError(e.getLocalizedMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return ajaxForwardError(getText("msg.operation.failure"));
		}

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public String remove() {
		ContentManager contentManager = BusinessFactory.getFactory()
				.getManager(BeanManagerKey.contentManager);
		
		try {
			contentManager.removeFile(this.getFileId());
		} catch (Exception e) {
			e.printStackTrace();
			return ajaxForwardError(getText("msg.operation.failure"));
		}

		return ajaxForwardSuccess(getText("msg.operation.success"));
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFolderId() {
		return folderId;
	}

	public void setFolderId(String folderId) {
		this.folderId = folderId;
	}

}