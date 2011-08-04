package com.pierre.osb.build;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("serial")
class ListResource extends ArrayList<Resource> {

	public List<String> getAllPaths() {
		List<String> result = new ArrayList<String>();
		for (Resource res : this) {
			result.add(res.getPath());
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
	    
	    retValue = "ListResource ( "
	        + super.toString() + TAB
	
	        + " )";
	
	    return retValue;
	}
	
	public String toStringShort()
	{
	    final String TAB = " ";
	    
	    StringBuilder retValue = new StringBuilder();
	    
	    retValue.append("<ListResource>\n");
	    for (Resource res : this) {
	    	retValue.append("   ");
	    	retValue.append(res.toStringShort());
	    	retValue.append("\n");
	    }
	    retValue.append("</ListResource>\n");
	
	    return retValue.toString();
	}	

}