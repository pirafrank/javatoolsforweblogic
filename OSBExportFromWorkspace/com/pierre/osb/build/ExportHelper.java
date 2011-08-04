package com.pierre.osb.build;


import static com.pierre.osb.build.ExportHelper.getExtensionFromFilename;
import static com.pierre.osb.build.ExportHelper.getPathBeforeExtension;
import static com.pierre.osb.build.ExportHelper.mapExtension;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import com.pierre.osb.build.OSBExportJar.EXTENSIONS;

public class ExportHelper {
	public static String getExtensionFromFilename(String fileName) {
		String[] elements = fileName.split("\\.");
		String extension = "";
		if (elements.length > 1) {
			extension = elements[elements.length - 1];
		}
		return extension;
	}

	public static String mapExtension(String extension) throws Exception {
		return EXTENSIONS.valueOf(extension).getLongName();
	}


	public static String readFileContent(File file) throws Exception {
		StringBuilder result = new StringBuilder();
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = null;
		boolean writeNewLine = false;
		while ((line=reader.readLine()) != null) {
			if (writeNewLine) {
				result.append("\n");   // Write system dependent end of line.
			}
			result.append(line);
			writeNewLine = true;
		}
		return result.toString();
	}


	public static void createZip(ListResource resources, String destinationJar) throws Exception {
		// These are the files to include in the ZIP file

		// Create a buffer for reading the files
		byte[] buf = new byte[1024];

		try {
			// Create the ZIP file
			
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(destinationJar));

			// Compress the files
			for (int index = 0; index < resources.size(); index++) {
				Resource resource = resources.get(index);

				// Add ZIP entry to output stream.
				out.putNextEntry(new ZipEntry(resource.getPathNewExtension()));

				BufferedReader reader = new BufferedReader(new StringReader(resource.getExportedContent()));
				
				// Transfer bytes from the file to the ZIP file
				String line;
				while ((line = reader.readLine()) != null) {
					out.write(line.getBytes());
				}

				// Complete the entry
				out.closeEntry();
				
			}

			// Complete the ZIP file
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	
	public static String getPathBeforeExtension(String fileName) {
		String extension = getExtensionFromFilename(fileName);
		String beforeExtension = fileName;
		if (extension.length() > 0) {
			beforeExtension = fileName.substring(0, fileName.lastIndexOf("." + extension));
		}
		return beforeExtension;
	}

	public static String replaceExtension(String fileName) throws Exception {
		String extension = getExtensionFromFilename(fileName);
		String beforeExtension = getPathBeforeExtension(fileName);
		String newExtension = mapExtension(extension);
		String newFileName = beforeExtension + "." + newExtension;
		return newFileName;		
	}
}
