<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:owl="http://www.w3.org/2002/07/owl#"
	xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
	xmlns:vann="http://purl.org/vocab/vann/"
	xmlns:skos="http://www.w3.org/2004/02/skos/core#"
>
	<xsl:template match="/owl:Ontology">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
				<base href="https://daxi.ml/vocab/{vann:preferredNamespacePrefix}#"/>
				<link about="#" rel="rdfs:isDefinedBy bibo:uri" href="https://daxi.ml/vocab/{vann:preferredNamespacePrefix}#"/>
				<meta about="#" property="rdfs:label" content="{vann:preferredNamespacePrefix}"/>
				<link rel="xhv:up" href="https://vocab.methodandstructure.com/"/>
				<title about="#" property="dct:title">
					<xsl:value-of select="name"/>
				</title>
				<!-- <link rel="stylesheet" type="text/css" href="/stylesheet"> -->
				<!-- <meta name="viewport" content="width=device-width, initial-scale=0.6, maximum-scale=2.0"> -->
			</head>
			<body typeof="bibo:Webpage">
				<main>
					<article>
						<section about="#" typeof="owl:Ontology">
							<h1>
								<xsl:value-of select="name"/>
							</h1>
							<dl>
								<dt>Author</dt>
								<dd><xsl:copy-of select="author/*"/></dd>
								<dt>Version</dt>
								<dd property="owl:versionInfo" datatype="xsd:string">
									<xsl:value-of select="version"/>
								</dd>
								<dt>Created</dt>
								<dd property="dct:created" datatype="xsd:dateTime" content="{created}">
									<xsl:value-of select="created"/>
								</dd>
								<dt>Preferred Namespace Prefix</dt>
								<dd>
									<code about="#" property="sh:prefix vann:preferredNamespacePrefix" datatype="xsd:token">
										<xsl:value-of select="vann:preferredNamespacePrefix"/>
									</code>
								</dd>
							</dl>
						</section>
						<section>
							<h2>Classes</h2>
							<xsl:for-each select="class">
								<section id="{id}" about="[{/owl:Ontology/vann:preferredNamespacePrefix}:{rdfs:label}]" typeof="owl:Class">
									<h3 property="rdfs:label">
										<xsl:value-of select="rdfs:label"/>
									</h3>
									<p property="skos:definition">
										<xsl:copy-of select="skos:definition/*"/>
									</p>
									<xsl:for-each select="skos:editorialNote">
										<aside property="skos:editorialNote">
											<p>
												<xsl:copy-of select="*"/>
											</p>
										</aside>
									</xsl:for-each>
									<dl>
										<dt>Subclass of:</dt>
										<dd>
											<a rel="rdfs:subClassOf" href="{rdfs:subClassOf/url}"> <!-- TODO href -->
												<xsl:value-of select="rdfs:subClassOf/label"/>
											</a>
										</dd>
									</dl>
								</section>
							</xsl:for-each>
						</section>
					</article>
				</main>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet> 
