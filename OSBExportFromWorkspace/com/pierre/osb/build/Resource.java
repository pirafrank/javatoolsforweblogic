package com.pierre.osb.build;

import static com.pierre.osb.build.ExportHelper.*;

import java.util.ArrayList;
import java.util.List;

import com.pierre.osb.build.OSBExportJar.EXTENSIONS;

/**
 * Identifies each file in build 
 * @author EXB866
 *
 */
class Resource {
	boolean isExportInfo = false;
	
	public boolean isExportInfo() {
		return isExportInfo;
	}

	public void setExportInfo(boolean isExportInfo) {
		this.isExportInfo = isExportInfo;
	}

	/** location of original file on file system : C:\pierre\workspaceSVN\GUTools\Caches\RegisterCachesMBean.proxy */
	String fullAbsolutePath;
	
	/** path as should appear in jar: GUTools/Caches/RegisterCachesMBean.proxy */
	String path;
	
	/** proxy, xq... */
	EXTENSIONS type;
	
	List<String> dependencies = new ArrayList<String>();
	
	/** File content on disk*/
	String originalContent;
	
	/** File content in jar*/
	String exportedContent;
	
	/** project to which this resource belongs*/
	String projectName;

	public String getProjectName() {
		return projectName;
	}

	public String getOriginalContent() {
		return originalContent;
	}

	public void setOriginalContent(String content) {
		this.originalContent = content;
	}

	public String getExportedContent() {
		return exportedContent;
	}

	public void setExportedContent(String exportedContent) {
		this.exportedContent = exportedContent;
	}

	public String getPath() {
		return path;
	}
	
	public String getPathNoExtension() {
		return getPathBeforeExtension(path);
	}	
			


	public void setPath(String path) {
		this.path = path;
	}
	public EXTENSIONS getType() {
		return type;
	}
	public void setType(EXTENSIONS type) {
		this.type = type;
	}
	public List<String> getDependencies() {
		return dependencies;
	}
	public void setDependencies(List<String> dependencies) {
		this.dependencies = dependencies;
	}

	public Resource(String fullAbsolutePath, String path, EXTENSIONS type) throws Exception {
		this.fullAbsolutePath = fullAbsolutePath;
		this.path = path;
		this.type = type;
	}

	public String getNewExtension() {
		return getType().getLongName();
	}

	public String getFullAbsolutePath() {
		return fullAbsolutePath;
	}

	public void setFullAbsolutePath(String fullAbsolutePath) {
		this.fullAbsolutePath = fullAbsolutePath;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
		
	}
	
	public String getPathNewExtension() throws Exception {
		String result;
		if (isExportInfo) {
			result =  getPath();
		}
		else {
			result = replaceExtension(this.getPath());
		}
		return result;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString()
	{
	    final String TAB = " ";
	    
	    String retValue = "";
	    
	    retValue = "Resource ( "
	        + super.toString() + TAB
	        + "fullAbsolutePath = " + this.fullAbsolutePath + TAB
	        + "path = " + this.path + TAB
	        + "type = " + this.type + TAB
	        + "dependencies = " + this.dependencies + TAB
	        + "originalContent = " + this.originalContent + TAB
	        + "exportedContent = " + this.exportedContent + TAB
	        + "projectName = " + this.projectName + TAB
	        + " )";
	
	    return retValue;
	}

	public String toStringShort()
	{
	    final String TAB = " ";
	    
	    String retValue = "";
	    
	    retValue = "<Resource>"
	        + "<fullAbsolutePath>" + this.fullAbsolutePath + "</fullAbsolutePath>"
	        + "<path>" + this.path + "</path>"
	        + "<type>" + this.type + "</type>"
	        + "<dependencies>" + this.dependencies + "</dependencies>"
	        + "<projectName>" + this.projectName + "</projectName>"
	        + "</Resource>";
	
	    return retValue;
	}

	public void addDependency(String ref) {
		getDependencies().add(ref);
		
	}	
}