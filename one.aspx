<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PedidoDeBoneless.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>mishisis boneless</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .group-box {
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: #B6D2CA;
        }
        .main-container {
            max-width: 800px;
            margin: 20px auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            background-color: #75A395;
        }
        .btn-toolbar {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <!-- Barra de herramientas -->
            <div class="btn-toolbar mb-4">
                <a href="#" class="btn btn-secondary" onclick="history.back()">Regresar</a>
                <a href="#" class="btn btn-danger" onclick="window.close()">Salir</a>
            </div>

            <h2 class="text-center mb-4">Mishiboneless</h2>
            <p>Realiza tu pedido</p>

            <!-- Grupo 1: Número de piezas y sabores -->
            <div class="group-box">
                <h4>PIEZAS</h4>
                <asp:DropDownList ID="ddlPiezas" runat="server" CssClass="form-select mb-3">
                    <asp:ListItem Text="6 piezas - $50" Value="50" />
                    <asp:ListItem Text="10 piezas - $80" Value="80" />
                    <asp:ListItem Text="15 piezas - $120" Value="120" />
                    <asp:ListItem Text="50 piezas - $350" Value="350" />
                    <asp:ListItem Text="75 piezas - $500" Value="500" />
                </asp:DropDownList>

                <h4>SABORES </h4>
                <p>Selecciona 2 sabores</p>
                <div>
                    <asp:CheckBox ID="cbMangoHabanero" runat="server" CssClass="form-check-input me-2" />
                    <label for="cbMangoHabanero" class="form-check-label" >Mango Habanero</label>
                </div>
                <div>
                    <asp:CheckBox ID="cbAtomica" runat="server" CssClass="form-check-input me-2" />
                    <label for="cbAtomica" class="form-check-label">Atómica</label>
                </div>
                <div>
                    <asp:CheckBox ID="cbPepper" runat="server" CssClass="form-check-input me-2" />
                    <label for="cbPepper" class="form-check-label">Pepper</label>
                </div>
                <div>
                    <asp:CheckBox ID="cbSpicyKorean" runat="server" CssClass="form-check-input me-2" />
                    <label for="cbSpicyKorean" class="form-check-label">Spicy Korean</label>
                </div>
                <div>
                    <asp:CheckBox ID="cbBBQ"  runat="server" CssClass="form-check-input me-2" />
                    <label for="cbBBQ" class="form-check-label">BBQ</label>
                </div>
            </div>

            <!-- Grupo 2: Aderezos -->
            <div class="group-box">
                <h4>ADEREZOS</h4>
                <asp:RadioButton ID="rbChipotle" GroupName="Aderezo"  runat="server" CssClass="form-check-input me-2" />
                <label for="rbChipotle" class="form-check-label">Spicy Chipotle</label><br />
                <asp:RadioButton ID="rbCheddar" GroupName="Aderezo"  runat="server" CssClass="form-check-input me-2" />
                <label for="rbCheddar" class="form-check-label">Queso Cheddar</label><br />
                <asp:RadioButton ID="rbBlueCheese" GroupName="Aderezo"  runat="server" CssClass="form-check-input me-2" />
                <label for="rbBlueCheese" class="form-check-label">Blue Cheese</label><br />
                <asp:RadioButton ID="rbRanch" GroupName="Aderezo" runat="server" CssClass="form-check-input me-2" />
                <label for="rbRanch" class="form-check-label">Ranch</label>
            </div>

            <!-- Grupo 3: Dirección -->
            <div class="group-box">
                <h4>DIRECCIÓN</h4>
                <label for="ddlCiudad">Ciudad:</label>
                <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="form-select mb-3">
                    <asp:ListItem Text="Seleccione una ciudad" Value="" />
                    <asp:ListItem Text="Puebla " Value="Puebla" />
                    <asp:ListItem Text="Tlaxcala" Value="Tlaxcala" />
      
                </asp:DropDownList>

                <label for="txtCalle">Calle:</label>
                <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control" />
            </div>

            <!-- Grupo 4: Fecha del Pedido -->
            <div class="group-box">
                <h4>FECHA DE PEDIDO</h4>
                <asp:TextBox ID="txtFechaPedido" runat="server" CssClass="form-control" TextMode="Date" />
            </div>

            <!-- Grupo 5: Datos de Tarjeta -->
            <div class="group-box">
                <h4>FORMA DE PAGO</h4>
                <label for="txtNumeroTarjeta">Número de Tarjeta:</label>
                <asp:TextBox ID="txtNumeroTarjeta" runat="server" CssClass="form-control" />

                <label for="txtFechaVencimiento" class="mt-2">Fecha de Vencimiento:</label>
                <asp:TextBox ID="txtFechaVencimiento" runat="server" CssClass="form-control" />

                <label for="txtCVV" class="mt-2">CVV:</label>
                <asp:TextBox ID="txtCVV" runat="server" CssClass="form-control" TextMode="Password" />

                <label for="txtNombreTarjeta" class="mt-2">A Nombre de:</label>
                <asp:TextBox ID="txtNombreTarjeta" runat="server" CssClass="form-control" />
            </div>

            <!-- Botón para Confirmar -->
            <div class="text-center">
                <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar Pedido" CssClass="btn btn-primary btn-lg" OnClick="btnConfirmar_Click" />
            </div>

            <!-- Resultado -->
            <div class="mt-4 text-center">
                <asp:Label ID="lblResultado" runat="server" CssClass="alert alert-success d-none"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>