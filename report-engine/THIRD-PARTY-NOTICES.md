# Third-Party Notices — ReportFactory Lite

ReportFactory Lite (© Maathra Technology and Consultancy Pvt. Ltd.) is built on open-source
software. This document attributes the third-party components it uses and their licenses. The
list of **directly declared** dependencies below is derived from [`pom.xml`](pom.xml); a complete
list including transitive dependencies (machine-generated from the same build) appears in the
appendix.

Each component remains under its own license; the copyright and license of each belong to its
respective authors. Nothing here grants rights to the third-party software beyond those in its own
license.

---

## 1. Directly declared dependencies (from `pom.xml`)

| Component | Version | License |
|---|---|---|
| Spring Boot (`spring-boot-starter-web`, and the Spring Boot / Spring Framework stack it pulls in) | 2.7.18 | Apache License 2.0 |
| Spring Security (`spring-security-web`, `spring-security-config`) | 5.7.11 | Apache License 2.0 |
| Apache Tomcat — embedded (jar build) / provided (war build) | 9.0.83 | Apache License 2.0 |
| Google Gson (`com.google.code.gson:gson`) | 2.9.1 | Apache License 2.0 |
| JSON-Java (`org.json:json`) | 20240303 | Public Domain (JSON License) |
| **JasperReports Library** and modules — `jasperreports`, `-json`, `-pdf`, `-fonts`, `-javascript`, `-charts`, `-barcode4j`, `-barbecue` | 7.0.7 | **GNU LGPL** (v3) |
| **JFreeChart** (`org.jfree:jfreechart`) | 1.5.6 | **GNU LGPL** (v2.1) |
| **JCommon** (`org.jfree:jcommon`) | 1.0.24 | **GNU LGPL** (v2.1) |
| **Mozilla Rhino** (`org.mozilla:rhino`) | 1.7.14 | **Mozilla Public License 2.0** |
| **OpenPDF** (`com.github.librepdf:openpdf`, pulled transitively by `jasperreports-pdf`) | 1.3.43.jaspersoft.1 | **GNU LGPL v2.1 / MPL 2.0** (dual) |
| Apache Batik (`batik-svggen`, `-awt-util`, `-dom`, `-util`, and the Batik modules they pull in) | 1.19 | Apache License 2.0 |
| Apache POI (`poi-ooxml`) | 5.2.3 | Apache License 2.0 |
| Barcode4J (`net.sf.barcode4j:barcode4j`) | 2.1 | Apache License 2.0 |
| Bouncy Castle (`bcprov-jdk15on`, `bcpkix-jdk15on`) — used for PDF encryption | 1.70 | Bouncy Castle Licence (MIT-style) |
| bucket4j (`bucket4j-core`) — console rate limiting | 8.0.1 | Apache License 2.0 |

Test-scope dependencies (JUnit, Mockito, AssertJ, Hamcrest, etc.) are used only to build and test
ReportFactory Lite and are **not** distributed in the product; they are listed in the appendix for
completeness.

---

## 2. License obligations worth noting

Most components are under permissive licenses (Apache 2.0, MIT-style, BSD, Public Domain), which
require only that the notices in this file be preserved.

A few components are under **weak-copyleft** licenses — the **GNU LGPL** (JasperReports, JFreeChart,
JCommon, OpenPDF) and the **Mozilla Public License 2.0** (Rhino, OpenPDF).

> **These obligations apply only to the third-party libraries named here — not to ReportFactory
> Lite.** ReportFactory Lite's own source code is proprietary to Maathra and is **not** disclosed by
> any of these licenses. ReportFactory Lite uses each library **unmodified, as a binary, through its
> public API (dynamic linking)**. Under the LGPL and MPL, using a library that way does **not** place
> the calling application under those licenses — that is precisely the distinction between the LGPL/MPL
> and the (full) GPL.

Because the libraries are used unmodified, the LGPL/MPL are satisfied by (a) identifying them and
reproducing their licenses — done here — and (b) making **the library's own source** available. As
we do not modify them, this is met by the upstream source for the exact versions listed above:

- JasperReports — https://community.jaspersoft.com/ / https://github.com/TIBCOSoftware/jasperreports
- JFreeChart / JCommon — https://www.jfree.org/jfreechart/ , https://github.com/jfree
- Mozilla Rhino — https://github.com/mozilla/rhino
- OpenPDF — https://github.com/LibrePDF/OpenPDF

Full license texts:

- Apache License 2.0 — https://www.apache.org/licenses/LICENSE-2.0
- GNU LGPL v2.1 — https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
- GNU LGPL v3.0 — https://www.gnu.org/licenses/lgpl-3.0.html
- Mozilla Public License 2.0 — https://www.mozilla.org/MPL/2.0/
- Bouncy Castle Licence — https://www.bouncycastle.org/licence.html
- JSON License — https://www.json.org/license.html

The links above point to the unmodified upstream source for each library at the exact version
shipped, which is all these licenses require. This concerns the third-party libraries only and
never Maathra's own code.

---

## 3. Appendix — complete dependency list (including transitive, machine-generated)

The following is generated from the Maven dependency tree of this build
(`license-maven-plugin:add-third-party`, `-Dlicense.excludeTransitiveDependencies=false`). It
includes transitive and test-scope dependencies. Where a line shows `(Unknown license)`, the
correct license is: Avalon Framework, Apache Commons CLI, Apache Commons Lang, Apache Ant /
ant-launcher → **Apache License 2.0**; OpenPDF → **LGPL 2.1 / MPL 2.0**; Barbecue
(`net.sourceforge.barbecue`) → permissive BSD-style (see project site).

<!-- BEGIN GENERATED THIRD-PARTY LIST -->
```
Lists of 130 third-party dependencies.
     (BSD License) AntLR Parser Generator (antlr:antlr:2.7.7 - http://www.antlr.org/)
     (Unknown license) avalon-framework-impl (avalon-framework:avalon-framework-impl:4.2.0 - no url defined)
     (Eclipse Public License - v 1.0) (GNU Lesser General Public License) Logback Classic Module (ch.qos.logback:logback-classic:1.2.12 - http://logback.qos.ch/logback-classic)
     (Eclipse Public License - v 1.0) (GNU Lesser General Public License) Logback Core Module (ch.qos.logback:logback-core:1.2.12 - http://logback.qos.ch/logback-core)
     (The BSD 3-Clause License (BSD3)) Adobe XMPCore (com.adobe.xmp:xmpcore:6.1.11 - https://www.adobe.com/devnet/xmp/library/eula-xmp-library-java.html)
     (The Apache Software License, Version 2.0) bucket4j-core (com.bucket4j:bucket4j-core:8.0.1 - http://github.com/bucket4j/bucket4j/bucket4j-core)
     (The Apache Software License, Version 2.0) Jackson-annotations (com.fasterxml.jackson.core:jackson-annotations:2.13.5 - http://github.com/FasterXML/jackson)
     (The Apache Software License, Version 2.0) Jackson-core (com.fasterxml.jackson.core:jackson-core:2.13.5 - https://github.com/FasterXML/jackson-core)
     (The Apache Software License, Version 2.0) jackson-databind (com.fasterxml.jackson.core:jackson-databind:2.13.5 - http://github.com/FasterXML/jackson)
     (The Apache Software License, Version 2.0) Jackson-dataformat-XML (com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.13.5 - https://github.com/FasterXML/jackson-dataformat-xml)
     (The Apache Software License, Version 2.0) Jackson datatype: jdk8 (com.fasterxml.jackson.datatype:jackson-datatype-jdk8:2.13.5 - https://github.com/FasterXML/jackson-modules-java8/jackson-datatype-jdk8)
     (The Apache Software License, Version 2.0) Jackson datatype: JSR310 (com.fasterxml.jackson.datatype:jackson-datatype-jsr310:2.13.5 - https://github.com/FasterXML/jackson-modules-java8/jackson-datatype-jsr310)
     (The Apache Software License, Version 2.0) Jackson-module-parameter-names (com.fasterxml.jackson.module:jackson-module-parameter-names:2.13.5 - https://github.com/FasterXML/jackson-modules-java8/jackson-module-parameter-names)
     (The Apache License, Version 2.0) Woodstox (com.fasterxml.woodstox:woodstox-core:6.4.0 - https://github.com/FasterXML/woodstox)
     (Unknown license) openpdf (com.github.librepdf:openpdf:1.3.43.jaspersoft.1 - no url defined)
     (BSD License) curvesapi (com.github.virtuald:curvesapi:1.07 - https://github.com/virtuald/curvesapi)
     (Apache-2.0) Gson (com.google.code.gson:gson:2.9.1 - https://github.com/google/gson/gson)
     (The Apache Software License, Version 2.0) ZXing Core (com.google.zxing:core:3.4.0 - https://github.com/zxing/zxing/core)
     (The Apache Software License, Version 2.0) project ':json-path' (com.jayway.jsonpath:json-path:2.7.0 - https://github.com/jayway/JsonPath)
     (The Apache Software License, Version 2.0) SparseBitSet (com.zaxxer:SparseBitSet:1.2 - https://github.com/brettwooldridge/SparseBitSet)
     (Unknown license) CLI (commons-cli:commons-cli:1.0 - no url defined)
     (Apache License, Version 2.0) Apache Commons Codec (commons-codec:commons-codec:1.15 - https://commons.apache.org/proper/commons-codec/)
     (Apache License, Version 2.0) Apache Commons IO (commons-io:commons-io:2.11.0 - https://commons.apache.org/proper/commons-io/)
     (Unknown license) Lang (commons-lang:commons-lang:1.0 - no url defined)
     (Apache-2.0) Apache Commons Logging (commons-logging:commons-logging:1.3.5 - https://commons.apache.org/proper/commons-logging/)
     (EDL 1.0) Jakarta Activation API jar (jakarta.activation:jakarta.activation-api:1.2.2 - https://github.com/eclipse-ee4j/jaf/jakarta.activation-api)
     (EPL 2.0) (GPL2 w/ CPE) Jakarta Annotations API (jakarta.annotation:jakarta.annotation-api:1.3.5 - https://projects.eclipse.org/projects/ee4j.ca)
     (Eclipse Distribution License - v 1.0) Jakarta XML Binding API (jakarta.xml.bind:jakarta.xml.bind-api:2.3.3 - https://github.com/eclipse-ee4j/jaxb-api/jakarta.xml.bind-api)
     (Eclipse Public License 1.0) JUnit (junit:junit:4.13.2 - http://junit.org)
     (Apache License, Version 2.0) Byte Buddy (without dependencies) (net.bytebuddy:byte-buddy:1.12.23 - https://bytebuddy.net/byte-buddy)
     (Apache License, Version 2.0) Byte Buddy agent (net.bytebuddy:byte-buddy-agent:1.12.23 - https://bytebuddy.net/byte-buddy-agent)
     (The Apache Software License, Version 2.0) ASM based accessors helper used by json-smart (net.minidev:accessors-smart:2.4.11 - https://urielch.github.io/)
     (The Apache Software License, Version 2.0) JSON Small and Fast Parser (net.minidev:json-smart:2.4.11 - https://urielch.github.io/)
     (The Apache Software License, Version 2.0) Barcode4J (net.sf.barcode4j:barcode4j:2.1 - http://barcode4j.sourceforge.net)
     (GNU Lesser General Public License) JasperReports Library (net.sf.jasperreports:jasperreports:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports Barbecue (net.sf.jasperreports:jasperreports-barbecue:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports Barcode4J (net.sf.jasperreports:jasperreports-barcode4j:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports Charts (net.sf.jasperreports:jasperreports-charts:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports Font Extension (net.sf.jasperreports:jasperreports-fonts:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports Javascript (net.sf.jasperreports:jasperreports-javascript:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports JSON (net.sf.jasperreports:jasperreports-json:7.0.7 - http://jasperreports.sourceforge.net)
     (GNU Lesser General Public License) JasperReports PDF (net.sf.jasperreports:jasperreports-pdf:7.0.7 - http://jasperreports.sourceforge.net)
     (Unknown license) barbecue (net.sourceforge.barbecue:barbecue:1.5-beta1 - http://barbecue.sourceforge.net/)
     (Unknown license) org.apache.tools.ant (org.apache.ant:ant:1.7.1 - http://ant.apache.org/ant/)
     (Unknown license) ant-launcher (org.apache.ant:ant-launcher:1.7.1 - http://ant.apache.org/ant-launcher/)
     (Apache-2.0) Apache Commons BeanUtils (org.apache.commons:commons-beanutils2:2.0.0-M2 - https://commons.apache.org/proper/commons-beanutils/)
     (Apache-2.0) Apache Commons Collections (org.apache.commons:commons-collections4:4.5.0 - https://commons.apache.org/proper/commons-collections/)
     (Apache License, Version 2.0) Apache Commons Compress (org.apache.commons:commons-compress:1.21 - https://commons.apache.org/proper/commons-compress/)
     (Apache License, Version 2.0) Apache Commons Lang (org.apache.commons:commons-lang3:3.12.0 - https://commons.apache.org/proper/commons-lang/)
     (Apache License, Version 2.0) Apache Commons Math (org.apache.commons:commons-math3:3.6.1 - http://commons.apache.org/proper/commons-math/)
     (Apache License, Version 2.0) Apache Log4j API (org.apache.logging.log4j:log4j-api:2.17.2 - https://logging.apache.org/log4j/2.x/log4j-api/)
     (Apache License, Version 2.0) Apache Log4j to SLF4J Adapter (org.apache.logging.log4j:log4j-to-slf4j:2.17.2 - https://logging.apache.org/log4j/2.x/log4j-to-slf4j/)
     (Apache License, Version 2.0) Apache POI - Common (org.apache.poi:poi:5.2.3 - https://poi.apache.org/)
     (Apache License, Version 2.0) Apache POI - API based on OPC and OOXML schemas (org.apache.poi:poi-ooxml:5.2.3 - https://poi.apache.org/)
     (Apache License, Version 2.0) Apache POI (org.apache.poi:poi-ooxml-lite:5.2.3 - https://poi.apache.org/)
     (Apache License, Version 2.0) tomcat-embed-core (org.apache.tomcat.embed:tomcat-embed-core:9.0.83 - https://tomcat.apache.org/)
     (Apache License, Version 2.0) tomcat-embed-el (org.apache.tomcat.embed:tomcat-embed-el:9.0.83 - https://tomcat.apache.org/)
     (Apache License, Version 2.0) tomcat-embed-websocket (org.apache.tomcat.embed:tomcat-embed-websocket:9.0.83 - https://tomcat.apache.org/)
     (The Apache Software License, Version 2.0) XmlBeans (org.apache.xmlbeans:xmlbeans:5.1.1 - https://xmlbeans.apache.org/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-anim (org.apache.xmlgraphics:batik-anim:1.19 - http://xmlgraphics.apache.org/batik/batik-anim/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-awt-util (org.apache.xmlgraphics:batik-awt-util:1.19 - http://xmlgraphics.apache.org/batik/batik-awt-util/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-bridge (org.apache.xmlgraphics:batik-bridge:1.19 - http://xmlgraphics.apache.org/batik/batik-bridge/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-constants (org.apache.xmlgraphics:batik-constants:1.19 - http://xmlgraphics.apache.org/batik/batik-constants/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-css (org.apache.xmlgraphics:batik-css:1.19 - http://xmlgraphics.apache.org/batik/batik-css/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-dom (org.apache.xmlgraphics:batik-dom:1.19 - http://xmlgraphics.apache.org/batik/batik-dom/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-ext (org.apache.xmlgraphics:batik-ext:1.19 - http://xmlgraphics.apache.org/batik/batik-ext/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-gvt (org.apache.xmlgraphics:batik-gvt:1.19 - http://xmlgraphics.apache.org/batik/batik-gvt/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-i18n (org.apache.xmlgraphics:batik-i18n:1.19 - http://xmlgraphics.apache.org/batik/batik-i18n/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-parser (org.apache.xmlgraphics:batik-parser:1.19 - http://xmlgraphics.apache.org/batik/batik-parser/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-script (org.apache.xmlgraphics:batik-script:1.19 - http://xmlgraphics.apache.org/batik/batik-script/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-shared-resources (org.apache.xmlgraphics:batik-shared-resources:1.19 - http://xmlgraphics.apache.org/batik/batik-shared-resources/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-svg-dom (org.apache.xmlgraphics:batik-svg-dom:1.19 - http://xmlgraphics.apache.org/batik/batik-svg-dom/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-svggen (org.apache.xmlgraphics:batik-svggen:1.19 - http://xmlgraphics.apache.org/batik/batik-svggen/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-util (org.apache.xmlgraphics:batik-util:1.19 - http://xmlgraphics.apache.org/batik/batik-util/)
     (The Apache Software License, Version 2.0) org.apache.xmlgraphics:batik-xml (org.apache.xmlgraphics:batik-xml:1.19 - http://xmlgraphics.apache.org/batik/batik-xml/)
     (The Apache Software License, Version 2.0) Apache XML Graphics Commons (org.apache.xmlgraphics:xmlgraphics-commons:2.11 - http://xmlgraphics.apache.org/commons/)
     (The Apache License, Version 2.0) org.apiguardian:apiguardian-api (org.apiguardian:apiguardian-api:1.1.2 - https://github.com/apiguardian-team/apiguardian)
     (Apache License, Version 2.0) AssertJ fluent assertions (org.assertj:assertj-core:3.22.0 - https://assertj.github.io/doc/assertj-core/)
     (Bouncy Castle Licence) Bouncy Castle PKIX, CMS, EAC, TSP, PKCS, OCSP, CMP, and CRMF APIs (org.bouncycastle:bcpkix-jdk15on:1.70 - https://www.bouncycastle.org/java.html)
     (Bouncy Castle Licence) Bouncy Castle Provider (org.bouncycastle:bcprov-jdk15on:1.70 - https://www.bouncycastle.org/java.html)
     (Bouncy Castle Licence) Bouncy Castle ASN.1 Extension and Utility APIs (org.bouncycastle:bcutil-jdk15on:1.70 - https://www.bouncycastle.org/java.html)
     (The BSD License) Stax2 API (org.codehaus.woodstox:stax2-api:4.2.1 - http://github.com/FasterXML/stax2-api)
     (BSD License 3) Hamcrest (org.hamcrest:hamcrest:2.2 - http://hamcrest.org/JavaHamcrest/)
     (BSD License 3) Hamcrest Core (org.hamcrest:hamcrest-core:2.2 - http://hamcrest.org/JavaHamcrest/)
     (GNU Lesser General Public Licence) JCommon (org.jfree:jcommon:1.0.24 - http://www.jfree.org/jcommon/)
     (GNU Lesser General Public Licence) JFreeChart (org.jfree:jfreechart:1.5.6 - https://www.jfree.org/jfreechart/)
     (Public Domain) JSON in Java (org.json:json:20240303 - https://github.com/douglascrockford/JSON-java)
     (Eclipse Public License v2.0) JUnit Jupiter (Aggregator) (org.junit.jupiter:junit-jupiter:5.8.2 - https://junit.org/junit5/)
     (Eclipse Public License v2.0) JUnit Jupiter API (org.junit.jupiter:junit-jupiter-api:5.8.2 - https://junit.org/junit5/)
     (Eclipse Public License v2.0) JUnit Jupiter Engine (org.junit.jupiter:junit-jupiter-engine:5.8.2 - https://junit.org/junit5/)
     (Eclipse Public License v2.0) JUnit Jupiter Params (org.junit.jupiter:junit-jupiter-params:5.8.2 - https://junit.org/junit5/)
     (Eclipse Public License v2.0) JUnit Platform Commons (org.junit.platform:junit-platform-commons:1.8.2 - https://junit.org/junit5/)
     (Eclipse Public License v2.0) JUnit Platform Engine API (org.junit.platform:junit-platform-engine:1.8.2 - https://junit.org/junit5/)
     (The MIT License) mockito-core (org.mockito:mockito-core:4.5.1 - https://github.com/mockito/mockito)
     (The MIT License) mockito-junit-jupiter (org.mockito:mockito-junit-jupiter:4.5.1 - https://github.com/mockito/mockito)
     (Mozilla Public License, Version 2.0) rhino (org.mozilla:rhino:1.7.14 - https://mozilla.github.io/rhino/)
     (Mozilla Public License, Version 2.0) rhino-tools (org.mozilla:rhino-tools:1.8.1 - https://mozilla.github.io/rhino/)
     (Apache License, Version 2.0) Objenesis (org.objenesis:objenesis:3.2 - http://objenesis.org/objenesis)
     (The Apache License, Version 2.0) org.opentest4j:opentest4j (org.opentest4j:opentest4j:1.2.0 - https://github.com/ota4j-team/opentest4j)
     (BSD-3-Clause) asm (org.ow2.asm:asm:9.3 - http://asm.ow2.io/)
     (The Apache Software License, Version 2.0) JSONassert (org.skyscreamer:jsonassert:1.5.1 - https://github.com/skyscreamer/JSONassert)
     (MIT License) JUL to SLF4J bridge (org.slf4j:jul-to-slf4j:1.7.36 - http://www.slf4j.org)
     (MIT License) SLF4J API Module (org.slf4j:slf4j-api:1.7.36 - http://www.slf4j.org)
     (Apache License, Version 2.0) Spring AOP (org.springframework:spring-aop:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Beans (org.springframework:spring-beans:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Context (org.springframework:spring-context:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Core (org.springframework:spring-core:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Expression Language (SpEL) (org.springframework:spring-expression:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Commons Logging Bridge (org.springframework:spring-jcl:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring TestContext Framework (org.springframework:spring-test:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Web (org.springframework:spring-web:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) Spring Web MVC (org.springframework:spring-webmvc:5.3.31 - https://github.com/spring-projects/spring-framework)
     (Apache License, Version 2.0) spring-boot (org.springframework.boot:spring-boot:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-autoconfigure (org.springframework.boot:spring-boot-autoconfigure:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-starter (org.springframework.boot:spring-boot-starter:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-starter-json (org.springframework.boot:spring-boot-starter-json:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-starter-logging (org.springframework.boot:spring-boot-starter-logging:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-starter-test (org.springframework.boot:spring-boot-starter-test:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-starter-tomcat (org.springframework.boot:spring-boot-starter-tomcat:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-starter-web (org.springframework.boot:spring-boot-starter-web:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-test (org.springframework.boot:spring-boot-test:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-boot-test-autoconfigure (org.springframework.boot:spring-boot-test-autoconfigure:2.7.18 - https://spring.io/projects/spring-boot)
     (Apache License, Version 2.0) spring-security-config (org.springframework.security:spring-security-config:5.7.11 - https://spring.io/projects/spring-security)
     (Apache License, Version 2.0) spring-security-core (org.springframework.security:spring-security-core:5.7.11 - https://spring.io/projects/spring-security)
     (Apache License, Version 2.0) spring-security-crypto (org.springframework.security:spring-security-crypto:5.7.11 - https://spring.io/projects/spring-security)
     (Apache License, Version 2.0) spring-security-web (org.springframework.security:spring-security-web:5.7.11 - https://spring.io/projects/spring-security)
     (The Apache Software License, Version 2.0) org.xmlunit:xmlunit-core (org.xmlunit:xmlunit-core:2.9.1 - https://www.xmlunit.org/)
     (Apache License, Version 2.0) SnakeYAML (org.yaml:snakeyaml:1.30 - https://bitbucket.org/snakeyaml/snakeyaml)
     (The Apache Software License, Version 2.0) (The SAX License) (The W3C License) XML Commons External Components XML APIs (xml-apis:xml-apis:1.4.01 - http://xml.apache.org/commons/components/external/)
     (The Apache Software License, Version 2.0) XML Commons External Components XML APIs Extensions (xml-apis:xml-apis-ext:1.3.04 - http://xml.apache.org/commons/components/external/)
```
<!-- END GENERATED THIRD-PARTY LIST -->
