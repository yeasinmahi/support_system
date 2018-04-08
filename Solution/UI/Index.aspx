<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UI.Index" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>.: Welcome to AG :.</title>
    <meta name="developer" content="Md. Golam Kibria (Konock), konock.22@gmail.com" />
    <meta name="designer" content="Md. Golam Kibria (Konock), konock_08@yahoo.com" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, heigth=device-heigth, initial-scale=1.0, user-scalable=yes" />
    <asp:PlaceHolder ID="PlaceHolder0" runat="server"><%: Scripts.Render("~/Content/Bundle/Jquery") %></asp:PlaceHolder>
    <webopt:bundlereference ID="BundleReference0" runat="server" Path="~/Content/Bundle/DefaultCss" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

</head>
<body>
    <form id="frmindex" runat="server"><asp:ScriptManager runat="server" ID="scriptManager" EnablePageMethods="true"></asp:ScriptManager>
    <div id="topbox"><table style="width:100%;">
    <tr><td style=" width:5%; text-align:left;"><img src="Content/Images/logo.png"/></td>
    <td style="text-align:center; font-size:25px;"> <strong style="color:darkgoldenrod;"><u>AKIJ GROUP</u></strong> <br/>
    <a class="blink_me"><b>ERP Support Solution</b></a></td></tr>
    <tr><td colspan="2" style="text-align:right; background-color:#faf2f2; "><br />
    <asp:Label ID="lblofficemail" CssClass="lbl" runat="server" Text="E-mail :- "></asp:Label>
    <asp:TextBox ID="txtOfficEmail" runat="server" CssClass="txtBox" TextMode="SingleLine"></asp:TextBox>
    <asp:Label ID="lblpassword" CssClass="lbl" runat="server" Text="Password :- "></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" CssClass="txtBox" Width="100px" TextMode="Password"></asp:TextBox>
    &nbsp<asp:Button ID="btnLogin" runat="server" CssClass="myButton" Text="Login" ToolTip="Click For Login" OnClick="btnLogin_Click"></asp:Button>
    </td></tr></table>
    </div>

    <table class="tbldecoration" style="width:100%;">
    <tr class="tblheader"><td style="text-align:right; background-color:white;" colspan="2">
    <asp:Label ID="lblerror" CssClass="lbl" runat="server" ForeColor="Red"></asp:Label></td></tr>
    <tr class="tblroweven"> <td style="text-align:justify; font-size:13px; background-color:white;"><img src="Content/Images/gr-01.png" />
    <br />History of Akij Group stretches back to later part of the forties. In its infancy, the Group started in humble way with jute trading which was known as the golden fiber of the country, earning highest amount of foreign exchange.<br /><br />
    Akij Group's ceaseless efforts with dynamic management and support from our numerous clients have led our Group in diversifying its business activities. In the second phase, the Group went into manufacturing handmade cigarettes popularly known as bidis. This sector gave a real boost to the revenue earning of the Group as well as making a substantial contribution to government exchequer. With the passage of time, the Group undertook new ventures and presently there are 15 units of industries under its umbrella like cigarettes, handmade cigarettes, printing & packaging, textiles, hand board, pharmaceutical, leather processing and real-estate business are in operation, catering jobs for more that 32,000 people in various categories.<br /><br />
    The Group has plans for setting up more projects. The projects are already in pipeline. Foreign investors have shown keen interest in joining with us for joint ventures. The matter is under our active consideration and will hopefully soon mature. This will also help the nation's economy growth and will create job opportunities to various professionals.<br /><br />
    Akij Group is also involved in socio-cultural activities. The Group has been operating a sizeable orphanage free of charge in district town. The Group has also acquired a modern mother & children hospital previously owned by Save the Children (UK). The hospital is being operated as a non-profitable concern by Ad-Din Welfare Trust. <br /><br />
    <b> Contact Us: </b><br /><p style="color:blue;font-size:15px; ">
    Akij Chamber<br /> 73, Dilkusha Commercial Area<br /> Dhaka - 1000, Bangladesh <br />
    Phone:(+880-2)9563008-9,7169017-8 <br />  Fax:(+880-2)9564519 <br />  e-mail:info@akij.net</p>

    </td></tr> 
    </table>
    <div id="footerbox">Developed By : Akij Group. Copyright @ support.akij.net 2017 - 2018</div>

    </form>
</body>
</html>
