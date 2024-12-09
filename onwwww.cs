using System;
using System.Web.UI;

namespace PedidoDeBoneless
{
    public partial class Default : Page
    {
        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            // Obtener datos seleccionados
            int precio = int.Parse(ddlPiezas.SelectedValue);

            // Sabores
            string sabores = "";
            int totalSabores = 0;
            if (cbMangoHabanero.Checked) { sabores += "Mango Habanero, "; totalSabores++; }
            if (cbAtomica.Checked) { sabores += "Atómica, "; totalSabores++; }
            if (cbPepper.Checked) { sabores += "Pepper, "; totalSabores++; }
            if (cbSpicyKorean.Checked) { sabores += "Spicy Korean, "; totalSabores++; }
            if (cbBBQ.Checked) { sabores += "BBQ, "; totalSabores++; }

            if (totalSabores != 2)
            {
                lblResultado.CssClass = "alert alert-warning";
                lblResultado.Text = "Por favor, selecciona solo 2 sabores.";
                lblResultado.Visible = true;
                return;
            }

            // Aderezo
            string aderezo = rbChipotle.Checked ? "Spicy Chipotle"
                          : rbCheddar.Checked ? "Queso Cheddar"
                          : rbBlueCheese.Checked ? "Blue Cheese"
                          : rbRanch.Checked ? "Ranch" : "Sin aderezo";

            // Dirección
            string ciudad = ddlCiudad.SelectedValue;
            string calle = txtCalle.Text;

            // Tarjeta
            string numeroTarjeta = txtNumeroTarjeta.Text;
            string fechaVencimiento = txtFechaVencimiento.Text;
            string cvv = txtCVV.Text;
            string nombreTarjeta = txtNombreTarjeta.Text;

            // Validar campos
            if (string.IsNullOrEmpty(ciudad) || string.IsNullOrEmpty(calle) ||
                string.IsNullOrEmpty(numeroTarjeta) || string.IsNullOrEmpty(fechaVencimiento) ||
                string.IsNullOrEmpty(cvv) || string.IsNullOrEmpty(nombreTarjeta))
            {
                lblResultado.CssClass = "alert alert-danger";
                lblResultado.Text = "Por favor, completa todos los campos.";
                lblResultado.Visible = true;
                return;
            }

            // Mostrar resultados
            lblResultado.CssClass = "alert alert-success";
            lblResultado.Text = $"Pedido confirmado. Total a pagar: ${precio}. Sabores: {sabores.TrimEnd(',', ' ')}. Aderezo: {aderezo}. Dirección: {ciudad}, {calle}.";
            lblResultado.Visible = true;





        }
    }
}






