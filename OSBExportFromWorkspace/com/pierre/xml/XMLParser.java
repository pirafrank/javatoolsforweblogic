package com.pierre.xml;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import javax.xml.namespace.NamespaceContext;
import javax.xml.namespace.QName;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;


public class XMLParser {
	public static void main(String[] args) throws Exception {
		XMLParser xmlParser = new XMLParser();
		//xmlParser.parse("C:/tmp/sbconfig2507_01/InterfacesGU/ETA/E_UPT_TIME_PS.ProxyService");
		List<String> xqueries = xmlParser.parseXQueryDependencies("C:/temp/dummy2.xml");
		for (String ref : xqueries) System.out.println(ref);
	}

	private List<String> parseXQueryDependencies(String string) throws Exception {
		List<String> result = new ArrayList<String>();
		XPathReader reader = new XPathReader(string);
		// xmlns:con3="http://www.bea.com/wli/sb/stages/config"
		String expression = ".//con3:xqueryTransform/con3:resource/@ref";
		//String expression = "//foo:value[1]";
		org.w3c.dom.NodeList read = (org.w3c.dom.NodeList)reader.read(expression, XPathConstants.NODESET);
		for (int i = 0 ; i < read.getLength(); i++) {
			Node item = read.item(i);
			if (item.getLocalName().equals("ref")) {
				String nodeValue = item.getNodeValue();
				if (!result.contains(nodeValue)) {
					result.add(nodeValue);
				}
			}
		}
		return result;
	}
}


class XPathReader {

	private String xmlFile;
	private Document xmlDocument;
	private XPath xPath;
	InputSource inputSource;

	public XPathReader(String xmlFile) throws Exception {
		this.xmlFile = xmlFile;
		initObjectsA();
	}

	private void initObjectsA() throws Exception{        
			xmlDocument = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(xmlFile); 
			inputSource = new InputSource(xmlFile);
			xPath =  XPathFactory.newInstance().newXPath();
			XMLInputFactory factory = XMLInputFactory.newInstance();
			XMLEventReader evtReader = factory.createXMLEventReader(new FileReader(xmlFile));
			NamespaceContext nsContext = null;
			while (evtReader.hasNext()) {
				XMLEvent event = evtReader.nextEvent();
				if (event.isStartElement()) {
					nsContext = ((StartElement) event).getNamespaceContext();
					break;
				}
			}
			xPath.setNamespaceContext(nsContext);
	}

	

    
    
	public Object read(String expression, QName returnType){
		try {
			XPathExpression xPathExpression = xPath.compile(expression);
			return xPathExpression.evaluate(inputSource, returnType);
		} catch (XPathExpressionException ex) {
			ex.printStackTrace();
			return null;
		}
	}
}

