using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Concessionaria
{
    public partial class Preventivo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Inizializza l'immagine dell'auto
                imgCar.ImageUrl = "~/Logo/Logo.png"; // Imposta il percorso dell'immagine
                imgCar.AlternateText = "Immagine JPG"; // Testo alternativo per l'immagine
                imgCar.Width = 800;
            }
        
    }

        protected void ddlCar_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Aggiorna l'immagine dell'auto in base alla selezione
            switch (ddlCar.SelectedItem.Text)
            {
                case "Auto Aviation":
                    imgCar.ImageUrl = "https://virali.video/wp-content/uploads/2021/02/auto-1.jpg";
                    imgCar.Width = 500;
                    LblPrezzo.Text = "4.375€";
                    break;
                case "Auto Duckler":
                    imgCar.ImageUrl = "https://i.kinja-img.com/gawker-media/image/upload/s--zKXRyv-o--/c_fill,fl_progressive,g_center,h_900,q_80,w_1600/18nbgrzzzl56cjpg.jpg";
                    imgCar.Width = 500;
                    LblPrezzo.Text = "11.000€";
                    break;
                case "Auto 500":
                    imgCar.ImageUrl = "https://i.pinimg.com/originals/c2/3e/1d/c23e1d1a4272b933539cfb6c46045288.jpg";
                    imgCar.Width = 500;
                    LblPrezzo.Text = "2.350€";
                    break;
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            // Verifica se è stata selezionata un'auto
            if (ddlCar.SelectedIndex == 0)
            {
                string script = "alert('Seleziona un\\'auto prima di procedere.');";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
                return;
            }
            // Verifica se è stato inserito il numero di anni di garanzia
            int warrantyYears;
            if (!int.TryParse(txtWarrantyYears.Text, out warrantyYears))
            {
                ShowErrorMessage("Inserisci un numero valido di anni di garanzia.");
                return;
            }

            // Calcola il totale complessivo
            decimal basePrice = decimal.Parse(LblPrezzo.Text.Replace("€", ""));
            decimal optionalTotal = CalculateOptionalTotal();
            decimal warrantyTotal = warrantyYears * 120;
            decimal totalPrice = basePrice + optionalTotal + warrantyTotal;

            // Visualizza i risultati
            lblBasePrice.Text = basePrice.ToString("C");
            lblOptionalTotal.Text = optionalTotal.ToString("C");
            lblWarrantyTotal.Text = warrantyTotal.ToString("C");
            lblTotalPrice.Text = totalPrice.ToString("C");
        }

        private decimal CalculateOptionalTotal()
        {
            decimal total = 0;
            foreach (ListItem item in cblOptions.Items)
            {
                if (item.Selected)
                {
                    total += decimal.Parse(item.Value.Replace("€", ""));
                }
            }
            return total;
        }

        private void ShowErrorMessage(string message)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", $"alert('{message}');", true);
        }
    }
}
