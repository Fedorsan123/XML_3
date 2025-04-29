<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Выводим HTML -->
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- Ключ для поиска курсов по преподавателю -->
    <xsl:key name="by-teacher" match="course" use="teachers/teacher"/>
    <!-- Ключ для поиска курсов по ключевому слову -->
    <xsl:key name="by-keyword" match="course" use="keywords/keyword"/>

    <!-- Главный шаблон -->
    <xsl:template match="/courses">
        <html>
            <body>
                <h1>Наши курсы</h1>

                <!-- Курсы Борисова И.О. -->
                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('by-teacher', 'Борисов И.О.')">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

                <!-- Курсы с темой XML -->
                <h3>Курсы, которые используют XML</h3>
                <ul>
                    <xsl:for-each select="key('by-keyword', 'XML')">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>

                <!-- Курсы Борисова И.О. с темой XSLT -->
                <h3>Курсы, которые читает Борисов И.О., и в которых есть тема XSLT</h3>
                <ul>
                    <xsl:for-each select="key('by-teacher', 'Борисов И.О.')[keywords/keyword = 'XSLT']">
                        <li><xsl:value-of select="title"/></li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
