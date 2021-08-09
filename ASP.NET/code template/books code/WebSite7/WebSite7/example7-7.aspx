<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="example7-7.aspx.cs" Inherits="WebSite7.example7_7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>某公司网站首页</title>
<link href="StyleSheet7-7.css" rel="stylesheet" type="text/css" />
</head>
<body id="home">
<div id="top"></div>
<div id="header">
    <div id="logoarea">
        <div id="logo">
            <h3 id="logo1"><a href="#" title="从Hello World开始">Hello World</a></h3>
        </div>
         <div id="menu">
             <br />
             <br />
             <br />
         ｜&nbsp;
     <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="#">Home</asp:HyperLink>&nbsp;｜&nbsp;
   <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="#">Nosso Conceito </asp:HyperLink>
             &nbsp;｜&nbsp;
   <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="#">Quem somos</asp:HyperLink>
             &nbsp;｜
   <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="#">O que fazemos</asp:HyperLink>
             &nbsp;｜&nbsp;
   <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="#">Parceiros</asp:HyperLink>
             &nbsp;｜
   <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="#">Contato</asp:HyperLink>
&nbsp;｜ &nbsp; &nbsp; &nbsp;

          </div>
         <div id="friend"></div>
    </div>
    <div id="banner"></div>
</div>
<div id="main">
    <div id="mainarea1">
        <dl>
        <dt><a href="#"><img src="images/example7-7/links_a.jpg" alt="" title=""/></a></dt>
        <dd>Cris Giacomini<a href="#" title=""></a></dd>
        <dd>Redação<a href="#" title=""></a></dd>
        <dd>Desvelando as teias da filosofia, psicologia e neurolinguística com um sopro de insanidade e paixão. Personalidade temperada com arte, música e cultura.<a href="#" title=""></a></dd>
        </dl>
       
    </div>
     <div id="mainarea2">
         <dl>
        <dt><a href="#"><img src="images/example7-7/links_b.jpg" alt="" title=""/></a></dt>
        <dd>Guilherme Leonel<a href="#" title=""></a></dd>
        <dd>Design<a href="#" title=""></a></dd>
        <dd>Louco por heavy metal. A criatividade corre nas veias e na pele rabiscada. “De qualquer jeito ultrapassar, quebrar paradigmas e continuar a expandir a mente...”<a href="#" title=""></a></dd>
        </dl>
    </div>
     <div id="mainarea3">
        <dl>
        <dt><a href="#"><img src="images/example7-7/links_c.jpg" alt="" title=""/></a></dt>
        <dd>Paulinha Cayoni<a href="#" title=""></a></dd>
        <dd>Planejamento<a href="#" title=""></a></dd>
        <dd>Puramente jovem. 'Buscando um novo rumo que faça sentido nesse mundo louco'. Apaixonada por publicidade, poesia e sorrisos sinceros.<a href="#" title=""></a></dd>
         </dl>
     </div>
      <div id="mainarea4">
          <dl>
        <dt><a href="#"><img src="images/example7-7/links_d.jpg" alt="" title=""/></a></dt>
        <dd>Faça parte da Insania<a href="#" title=""></a></dd>
        <dd>Envie seu currículo<a href="#" title=""></a></dd>
        <dd>Se você é insano por natureza e pouca gente te escuta, clique na imagem e venha fazer parte da nossa equipe.
Aqui curtimos novas ideias.<a href="#" title=""></a></dd>
        </dl>
    </div>
</div>
<div id="footer">
    <br />
    版权所有：Web Design I Love CSS--<a href="#" title="">www.website.com</a>未经本站同意，严禁转载
</div>
</body>
</html>
