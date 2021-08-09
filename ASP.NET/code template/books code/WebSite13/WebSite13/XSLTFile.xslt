<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:template match="/">
    <html>
      <body>
        <h2>学生信息</h2>
        <table border="1">
          <tr bgcolor="#ff6ec7">
            <th align="left">学号</th>
            <th align="left">姓名</th>
            <th align="left">性别</th>
            <th align="left">年龄</th>
            <th align="left">住址</th>
          </tr>
          <xsl:for-each select="students/student">
            <tr>
              <td>
                <xsl:value-of select="no" />
              </td>
              <td>
                <xsl:value-of select="name" />
              </td>
              <td>
                <xsl:value-of select="sex" />
              </td>
              <td>
                <xsl:value-of select="birth" />
              </td>
              <td>
                <xsl:value-of select="address" />
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
