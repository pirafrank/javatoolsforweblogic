package com.pierre.osb.build;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class OSBExportJar {
	final String XML_PREAMBLE = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";

	Comparator<Include> comparatorInclude = new Comparator<Include>() {

		@Override
		public int compare(Include o1, Include o2) {
			return o1.schemaLocation.compareTo(o2.schemaLocation);
		}
	};

	Comparator<Import> comparatorImport = new Comparator<Import>() {

		@Override
		public int compare(Import o1, Import o2) {
			return o1.schemaLocation.compareTo(o2.schemaLocation);
		}
	};

	/**
	 * Identifies each file in build 
	 * @author EXB866
	 *
	 */
	class Resource {
		String path;
		EXTENSIONS type;
		List<String> dependencies;
		public String getPath() {
			return path;
		}
		
		public String getPathWithExtension() {
			return path + "." + getType().getLongName();
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

		public Resource(String path, EXTENSIONS type) {
			this.path = path;
			this.type = type;
		}

	}

	@SuppressWarnings("serial")
	class ListResource extends ArrayList<Resource> {

		public List<String> getAllPaths() {
			List<String> result = new ArrayList<String>();
			for (Resource res : this) {
				result.add(res.getPath());
			}
			return result;
		}

	}

	public enum EXTENSIONS {
		sa("ServiceAccount", "com.bea.wli.sb.svcacct.StaticServiceAccountConfig", "25"), 
		mqc("MQConnection", "com.bea.wli.sb.resources.custom.ResourceDataObject", "30"), 
		biz("BusinessService", "com.bea.wli.sb.services.impl.ServiceDefinitionImpl", "3000"), 
		proxy("ProxyService", "com.bea.wli.sb.services.impl.ServiceDefinitionImpl", "3000"), 
		xq("Xquery", "com.bea.wli.sb.resources.config.impl.XqueryEntryDocumentImpl", "0"), 
		alert("AlertDestination", "com.bea.wli.monitoring.alert.impl.AlertDestinationImpl", "30"), 
		xsd("XMLSchema", "com.bea.wli.sb.resources.config.impl.SchemaEntryDocumentImpl", "0"), 
		wsdl("WSDL", "com.bea.wli.sb.resources.config.impl.WsdlEntryDocumentImpl", "0"),
		_folderdata("LocationData", "com.bea.wli.config.project.impl.LocationDataImpl", "0"),
		_projectdata("LocationData", "com.bea.wli.config.project.impl.LocationDataImpl", "0");

		private final String longName;
		private final String implementation;
		private final String representationversion;

		EXTENSIONS(String longName, String implementation, String representationversion) {
			this.longName = longName;
			this.implementation = implementation;
			this.representationversion = representationversion;
		}

		public String getLongName() {
			return longName;
		}

		public String getImplementation() {
			return implementation;
		}

		public String getRepresentationversion() {
			return representationversion;
		}


	}

	ListResource resources = new ListResource();

	String theWorkspace = null; 

	public static void main(String[] args) throws Exception {
		String previous = System.getProperty("line.separator");
		System.setProperty("line.separator", "\n");
		OSBExportJar exportJar = new OSBExportJar();
		exportJar.export("C:/pierre/workspaceSVN/", "GlobalResources,GUTools,InterfacesGU,InterfacesFRO,MockFRO", "c:/tmp/", "pvexport.jar");
		System.setProperty("line.separator", previous);
	}

	public void export(String workspace, String projectList, String destinationFolder, String destinationJar) throws Exception {
		theWorkspace = workspace;
		// check for existence of workspace
		File workspaceDir = new File(workspace);
		if (!workspaceDir.exists() || !workspaceDir.isDirectory()) {
			throw new IllegalArgumentException("invalid dir " + workspace);
		}
		// create destination folder
		File destinationFolderDir = new File(destinationFolder);
		if (!destinationFolderDir.exists() || !destinationFolderDir.isDirectory()) {
			throw new IllegalArgumentException("invalid dir " + destinationFolder);
		}
		// remove existing garbage in destination folder
		File temporaryOutDir1 = new File(destinationFolder + "osbjarexport");
		if (temporaryOutDir1.exists()) {
			deleteDir(temporaryOutDir1);
		}
		//create brand new destination folder
		File temporaryOutDir2 = new File(destinationFolder + "osbjarexport");
		temporaryOutDir2.mkdir();

		// build project list
		String[] list = projectList.split(",");
		ArrayList<String> projectsToExport = new ArrayList<String>(Arrays.asList(list));

		// build resources list
		for (File dir : workspaceDir.listFiles()) {
			String projectName = dir.getName();
			if (dir.isDirectory() && projectsToExport.contains(projectName)) {
				System.out.println("scanning for resources " + dir.getAbsolutePath());
				scanAllFilesRecursively(dir);
			}
		}		

		// export one project at a time
		for (File dir : workspaceDir.listFiles()) {
			String projectName = dir.getName();
			if (dir.isDirectory() && projectsToExport.contains(projectName)) {
				System.out.println("treating " + dir.getAbsolutePath());
				File projectOutDir = new File(temporaryOutDir2, projectName);
				boolean successOnCreateDir = projectOutDir.mkdir();
				if (!successOnCreateDir) throw new Exception("unable to create dir for " + projectName);
				doLocationData(projectOutDir, false);
				processAllFilesRecursively(dir, projectOutDir);
			}
		}


	}


	/*
	 * Add all files to resource collection
	 */
	private void scanAllFilesRecursively(File dir) {

		for (File file : dir.listFiles()) {
			if (file.isDirectory()) {
				String dirName = file.getName();
				if (!dirName.startsWith(".")) {
					scanAllFilesRecursively(file);
				}
			}
			else {
				String fileName = file.getName();
				// make sure you exclude .project 
				if (!fileName.startsWith(".")) {
					String absolutePath = file.getAbsolutePath().replaceAll("\\\\", "/");
					String extension = getExtensionFromFilename(fileName);
					resources.add(new Resource(absolutePath.substring(theWorkspace.length()), EXTENSIONS.valueOf(extension) ));
				}
			}
		}

	}

	private void processAllFilesRecursively(File dir, File projectOutDir) throws Exception {
		for (File file : dir.listFiles()) {
			if (file.isDirectory()) {
				String dirName = file.getName();
				if (!dirName.startsWith(".")) {
					File outDir = new File(projectOutDir, dirName);
					boolean successOnCreateDir = outDir.mkdir();
					if (!successOnCreateDir) throw new Exception("unable to create dir for " + dirName);
					doLocationData(outDir, true);
					processAllFilesRecursively(file, outDir);
				}
			}
			else {
				String fileName = file.getName();
				// make sure you exclude .project 
				if (!fileName.startsWith(".")) {
					String extension = getExtensionFromFilename(fileName);
					String beforeExtension = fileName.substring(0, fileName.lastIndexOf("." + extension));
					String newExtension = mapExtension(extension);
					String newFileName = beforeExtension + "." + newExtension;
					copy(file, new File(projectOutDir, newFileName), extension);
				}
			}
		}

	}

	private String mapExtension(String extension) throws Exception {
		return EXTENSIONS.valueOf(extension).getLongName();
	}

	private void doLocationData(File outDir, boolean isFolderData) throws Exception {
		String filename = isFolderData? "_folderdata.LocationData" : "_projectdata.LocationData";
		String fileContent = XML_PREAMBLE + "\n<proj:isImmutable xmlns:proj=\"http://www.bea.com/wli/config/project\">false</proj:isImmutable>";
		File file = new File(outDir, filename);
		BufferedWriter out = new BufferedWriter(new FileWriter(file));
		out.write(fileContent);
		out.close();
	}


	// Deletes all files and subdirectories under dir.
	// Returns true if all deletions were successful.
	// If a deletion fails, the method stops attempting to delete and returns false.
	public static boolean deleteDir(File dir) {
		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (int i=0; i<children.length; i++) {
				boolean success = deleteDir(new File(dir, children[i]));
				if (!success) {
					return false;
				}
			}
		}

		// The directory is now empty so delete it
		return dir.delete();
	}

	// Copies src file to dst file.
	// If the dst file does not exist, it is created
	void copy(File src, File dst, String extension) throws IOException {
		EXTENSIONS ext = EXTENSIONS.valueOf(extension);
		List<String> xqLocations = new ArrayList<String>();
		List<Include> xsdIncludes = new ArrayList<Include>();
		List<Import> xsdImports = new ArrayList<Import>();
		List<Import> wsdlXsdImports = new ArrayList<Import>();
		List<Import> wsdlImports = new ArrayList<Import>();
		String wsdlNamespace = null;
		String xsdNamespace = null;

		BufferedReader reader = new BufferedReader(new FileReader(src));
		BufferedWriter writer = new BufferedWriter(new FileWriter(dst));
		switch (ext) {
		case xq:
			writer.write(XML_PREAMBLE + "\n<con:xqueryEntry xmlns:con=\"http://www.bea.com/wli/sb/resources/config\">\n<con:xquery><![CDATA[");
			break;
		case xsd:
			writer.write(XML_PREAMBLE + "\n<con:schemaEntry xmlns:con=\"http://www.bea.com/wli/sb/resources/config\">\n    <con:schema><![CDATA[");
			break;
		case wsdl:
			writer.write(XML_PREAMBLE + "\n<con:wsdlEntry xmlns:con=\"http://www.bea.com/wli/sb/resources/config\">\n<con:wsdl><![CDATA[");
		}

		// check for "pragma bea:global-element-parameter"

		String line = null;
		boolean writeNewLine = false;
		while ((line=reader.readLine()) != null) {
			switch (ext) {
			case xq:
				String location = getLocationFromPragma(line);
				if (location != null && !xqLocations.contains(location)) xqLocations.add(location);

				break;

			case xsd:
				Include dependencyInclude = getDependencyFromInclude(line);
				if (dependencyInclude != null) xsdIncludes.add(dependencyInclude);
				Import dependencyImport = getDependencyFromImport(line);
				if (dependencyImport != null) xsdImports.add(dependencyImport);

				String xsdGuessNamespace = findNamespace(line);
				if (xsdGuessNamespace != null && xsdNamespace == null) {
					xsdNamespace = xsdGuessNamespace;
				}					
				break;

			case wsdl:
				String wsdlGuessNamespace = findNamespace(line);
				if (wsdlGuessNamespace != null && wsdlNamespace == null) {
					wsdlNamespace = wsdlGuessNamespace;
				}
				//  <wsdl:import namespace="http://www.acme.be/A204/FRO" location="InfraServices0.wsdl"/>
				Import wsdlXsdDependencyImport = getXSDWSDLDependencyFromImport(line);
				if (wsdlXsdDependencyImport != null) wsdlXsdImports.add(wsdlXsdDependencyImport);
				Import wsdlDependencyImport = getWSDLDependencyFromImport(line);
				if (wsdlDependencyImport != null) wsdlImports.add(wsdlDependencyImport);
				break;
			}
			if (writeNewLine) {
				writer.newLine();   // Write system dependent end of line.
			}
			writer.write(line);
			writeNewLine = true;
		}


		Collections.sort(xsdIncludes, comparatorInclude);
		//Collections.sort(xsdImports, comparatorImport);


		switch (ext) {
		case xq:
			writer.write("]]></con:xquery>\n");
			for (String loc : xqLocations) {
				writer.write("\n<con:dependency location=\"" + loc + "\"/>");
			}
			writer.write("\n</con:xqueryEntry>");
			break;
		case xsd:
			writer.write("]]></con:schema>\n");
			boolean hasDependencies = (xsdImports.size() > 0) || (xsdIncludes.size() > 0);
			if (hasDependencies) {
				writer.write("    <con:dependencies>");
			}
			for (Import myImport : xsdImports) {
				writer.write("\n        <con:import namespace=\"" + myImport.namespace + "\" schemaLocation=\"" + myImport.schemaLocation + "\" ref=\"" + myImport.ref + "\"/>");
			}
			for (Include myInclude : xsdIncludes) {
				writer.write("\n        <con:include schemaLocation=\"" + myInclude.schemaLocation + "\" ref=\"" + myInclude.ref + "\"/>");
			}
			if (hasDependencies) {
				writer.write("\n    </con:dependencies>");
			}
			if (xsdNamespace != null) {
				writer.write("\n    <con:targetNamespace>" + xsdNamespace + "</con:targetNamespace>");
			}

			//writer.write("<con:targetNamespace>http://schemas.microsoft.com/2003/10/Serialization/Arrays</con:targetNamespace>\n");
			writer.write("\n</con:schemaEntry>");
			break;
		case wsdl:
			writer.write("]]></con:wsdl>");
			if ( (wsdlXsdImports.size() > 0) || (wsdlImports.size() > 0) ) {
				writer.write("\n    <con:dependencies>");
				for (Import imp : wsdlXsdImports) {
					writer.write("\n        <con:schemaRef isInclude=\"false\" schemaLocation=\"" + imp.schemaLocation + "\" namespace=\"" + imp.namespace + "\" ref=\"" + imp.ref + "\"/>");
				}
				for (Import imp : wsdlImports) {
					writer.write("\n        <con:import location=\"" + imp.schemaLocation + "\" namespace=\"" + imp.namespace + "\">");
					writer.write("\n        <con:wsdl ref=\"" + imp.ref + "\"/>");
					writer.write( "\n</con:import>");

				}				
				writer.write("\n    </con:dependencies>");
				if (wsdlNamespace != null) {
					writer.write("\n<con:targetNamespace>" + wsdlNamespace + "</con:targetNamespace>");
				}
			}

			writer.write("\n</con:wsdlEntry>");
		}


		reader.close();
		writer.close();
	}

	//  <xsd:schema targetNamespace="http://www.acme.be/A204/FRO/Imports">
	private String findNamespace(String line) {
		String result = null;
		if (line.contains("schema") && line.contains("targetNamespace=")) {
			result = getPropertyValueFromAnything(line, "targetNamespace=");
		}
		return result;
	}

	private Import getXSDWSDLDependencyFromImport(String maybeImport) {
		Import result = null;
		if ( maybeImport.contains("xsd:import") && maybeImport.contains("namespace") && maybeImport.contains("schemaLocation") ) {
			String namespace = getPropertyValueFromAnything(maybeImport, "namespace=");
			if (namespace != null) {
				result = new Import();
				result.namespace = namespace;
				result.schemaLocation = getPropertyValueFromAnything(maybeImport, "schemaLocation=");
				result.ref = getRefForSchema(result.schemaLocation);
			}
		}
		return result;		
	}

	private Import getWSDLDependencyFromImport(String maybeImport) {
		Import result = null;
		if ( maybeImport.contains("wsdl:import") && maybeImport.contains("namespace") && maybeImport.contains("location") ) {
			String namespace = getPropertyValueFromAnything(maybeImport, "namespace=");
			if (namespace != null) {
				result = new Import();
				result.namespace = namespace;
				result.schemaLocation = getPropertyValueFromAnything(maybeImport, "location=");
				result.ref = getRefForSchema(result.schemaLocation);
			}
		}
		return result;		
	}	

	// <xs:include schemaLocation="BookType.xsd"/>
	private Include getDependencyFromInclude(String maybeInclude) {
		Include result = null;
		if ( maybeInclude.contains("include") && maybeInclude.contains("schemaLocation=") ) {
			String schemaLocation = getPropertyValueFromAnything(maybeInclude, "schemaLocation=");
			if (schemaLocation != null) {
				result = new Include();
				result.schemaLocation = schemaLocation;
				result.ref = getRefForSchema(schemaLocation);
			}
		}
		return result;		
	}

	// input is ../CommonSchemas/Serialization.xsd, output is InterfacesFRO/CommonSchemas/Serialization
	public String getRefForSchema(String schemaLocation) {
		int beginIndex = schemaLocation.lastIndexOf("/");

		String refName = schemaLocation.substring(beginIndex + 1);
		String resource = lookupResource(refName);
		return resource;
	}

	private String lookupResource(String refName) {
		String result = null;
		if (refName.endsWith("Serialization.xsd")) {
			result = null;
		}
		try {
			for (String res : resources.getAllPaths()) {
				if (res.endsWith("/" + refName)) {
					result = res;
					break;
				}
			}
			if (result.endsWith(".xsd")) {
				result = result.substring(0, result.length() - ".xsd".length());
			}
			if (result.endsWith(".wsdl")) {
				result = result.substring(0, result.length() - ".wsdl".length());
			}
		}
		catch (Exception e) {
			System.out.println(refName + " could not be found");
		}
		return result;
	}

	// <xs:import schemaLocation="../CommonSchemas/Serialization.xsd" namespace="http://schemas.microsoft.com/2003/10/Serialization/"/>
	private Import getDependencyFromImport(String maybeInclude) {
		Import result = null;
		if ( maybeInclude.contains("import") && maybeInclude.contains("schemaLocation=") ) {

			String schemaLocation = getPropertyValueFromAnything(maybeInclude, "schemaLocation=");
			if (schemaLocation != null) {
				result = new Import();
				result.schemaLocation = schemaLocation;
				result.namespace = getPropertyValueFromAnything(maybeInclude, "namespace=");
				result.ref = getRefForSchema(schemaLocation);
			}
		}
		return result;		
	}

	public static String getPropertyValueFromAnything(String maybeInclude, String anything) {
		String result = null;
		maybeInclude = maybeInclude.replaceAll("\"", "'");
		if (maybeInclude.contains(anything)) {
			int index1 = maybeInclude.indexOf(anything);
			String afterString = maybeInclude.substring(index1 + anything.length() + 1);
			int index2 = afterString.indexOf("'");
			result = afterString.substring(0, index2);
		}
		return result;		
	}	

	// (:: pragma bea:global-element-parameter parameter="$retrieveBookDetailsByIdResponse1" element="ns0:RetrieveBookDetailsByIdResponse" location="../../InterfacesFRO/SearchByBookService/FRO.xsd" ::)

	public static String getLocationFromPragma(String maybePragma) {
		String result = null;
		if (maybePragma.contains("pragma bea:global-element")) {
			String locationConstant = " location=\"";
			int index1 = maybePragma.indexOf(locationConstant);
			String afterString = maybePragma.substring(index1 + locationConstant.length());
			int index2 = afterString.indexOf("\"");
			result = afterString.substring(0, index2);
		}
		return result;
	}


	class Import {
		String namespace;
		String schemaLocation;
		String ref;
	}

	class Include {
		String schemaLocation;
		String ref;
	}


	private String buildExportInfo() {
		StringBuilder result = new StringBuilder();
		result.append(XML_PREAMBLE + "\n");
		result.append("<xml-fragment name=\"\" version=\"v2\">\n");
		result.append("      <imp:properties xmlns:imp=\"http://www.bea.com/wli/config/importexport\">");
		result.append("            <imp:property name=\"username\" value=\"pierluigi\"/>");
		result.append("            <imp:property name=\"description\" value=\"\"/>");
		result.append("            <imp:property name=\"exporttime\" value=\"Tue Jul 26 10:31:07 CEST 2011\"/>");
		result.append("            <imp:property name=\"productname\" value=\"Oracle Service Bus\"/>");
		result.append("            <imp:property name=\"productversion\" value=\"11.1.1.4\"/>");
		result.append("            <imp:property name=\"projectLevelExport\" value=\"true\"/>");
		result.append("      </imp:properties>");

		for (Resource res: resources) {
			result.append("<imp:exportedItemInfo instanceId=\"" + res.getPath() + "\" typeId=\"" + res.getType().name() +  "\" xmlns:imp=\"http://www.bea.com/wli/config/importexport\">");

			result.append("<imp:properties>");
			result.append("<imp:property name=\"representationversion\" value=\"" + res.getType().getRepresentationversion() + "\"/>");
			result.append("<imp:property name=\"dataclass\" value=\"" + res.getType().getImplementation() + "\"/>");
			result.append("<imp:property name=\"isencrypted\" value=\"false\"/>");
			result.append("<imp:property name=\"jarentryname\" value=\"" + res.getPathWithExtension() + "\"/>");
			
			for (String dep : res.getDependencies()) {
				result.append("<imp:property name=\"extrefs\" value=\"" + dep + "\"/>\n");
			}
			
			result.append("/<imp:properties>");
			result.append("<imp:exportedItemInfo>");

		}

		return result.toString();
	}


	private static String getExtensionFromFilename(String fileName) {
		String[] elements = fileName.split("\\.");
		String extension = "";
		if (elements.length > 0) {
			extension = elements[elements.length - 1];
		}
		return extension;
	}
}
