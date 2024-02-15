<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preventivo.aspx.cs" Inherits="Concessionaria.Preventivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Preventivo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
}


.container {
    margin-top: 50px;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
    padding: 0 20px;
}

.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}


.card-header {
    background-color: #007bff;
    color: #fff;
    border-radius: 15px 15px 0 0;
    padding: 20px;
    text-align: center;
}


.card-header h2 {
    margin: 0;
}

.card-body {
    padding: 20px;
}

.btn {
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    color: #fff;
    transition: background-color 0.3s;
    text-transform: uppercase;
    padding: 10px 20px;
    cursor: pointer;
}

.btn:hover {
    background-color: #0056b3;
}


.image-fluid {
    max-width: 100%;
    height: auto;
    border-radius: 10px;
}


.result {
    font-size: 18px;
    margin-bottom: 5px;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">Preventivo</h2>
                </div>
                <div class="card-body">
                    <h3>Seleziona Auto</h3>
                    <asp:DropDownList ID="ddlCar" runat="server" CssClass="form-select mb-3" AutoPostBack="true" OnSelectedIndexChanged="ddlCar_SelectedIndexChanged">
                        <asp:ListItem Text="Seleziona..." Value=""></asp:ListItem>
                        <asp:ListItem Text="Auto Aviation" Value="20000"></asp:ListItem>
                        <asp:ListItem Text="Auto Duckler" Value="25000"></asp:ListItem>
                        <asp:ListItem Text="Auto 500" Value="30000"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Image ID="imgCar" runat="server" CssClass="img-fluid" />
                    <br />
                    
                    <h3>Prezzo:</h3>
                    <asp:Label ID="LblPrezzo" runat="server" Text="" CssClass="fw-bold"></asp:Label>
                    <h3>Seleziona Optional</h3>
                    <asp:CheckBoxList ID="cblOptions" runat="server" CssClass="mb-3">
                        <asp:ListItem Text="Alettone Boost 2000 (1000€)" Value="1000"></asp:ListItem>
                        <asp:ListItem Text="Luci allo xeon (1500€)" Value="1500"></asp:ListItem>
                        <asp:ListItem Text="Cowcatcher (2000€)" Value="2000"></asp:ListItem>
                    </asp:CheckBoxList>
                    <br />
                   
                    <h3>Numero di anni di garanzia</h3>
                    <asp:TextBox ID="txtWarrantyYears" runat="server" CssClass="form-control mb-3"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnCalculate" runat="server" Text="Calcola Preventivo" OnClick="btnCalculate_Click" CssClass="btn btn-lg btn-block" />
                    <br />

                    <h2 class="mt-4">Risultati</h2>
                    
                    <p>Prezzo di base:
                        <asp:Label ID="lblBasePrice" runat="server" CssClass="fw-bold"></asp:Label></p>
                    <p>Totale optional:
                        <asp:Label ID="lblOptionalTotal" runat="server" CssClass="fw-bold"></asp:Label></p>
                    <p>Totale garanzia:
                        <asp:Label ID="lblWarrantyTotal" runat="server" CssClass="fw-bold"></asp:Label></p>
                    <p>Totale complessivo:
                        <asp:Label ID="lblTotalPrice" runat="server" CssClass="fw-bold"></asp:Label></p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>