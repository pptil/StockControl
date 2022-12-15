using Modelo.Models;
using Spire.Pdf;
using Spire.Pdf.Graphics;
using System;
using System.Drawing;
using System.IO;
using System.Linq;

namespace Business.Helpers
{
    public static class PDFHelper
    {
        //create a PDF document

        #region "Pedido"
        public static PdfDocument CreatePDF(Pedidos pedido)
        {
            PdfDocument doc = new PdfDocument();

            doc.PageSettings.Size = PdfPageSize.A4;

            //reset the default margins to 0
            doc.PageSettings.Margins = new PdfMargins(0);

            PdfMargins margins = new PdfMargins(15, 45, 15, 30);
            var proveedor = pedido.Proveedores is null ? string.Empty : pedido.Proveedores.Nombre;
            doc.Template.Top = CreateHeaderTemplatePedido(doc, margins, proveedor);

            //apply blank templates to other parts of page template

            doc.Template.Bottom = new PdfPageTemplateElement(doc.PageSettings.Size.Width, margins.Bottom);

            doc.Template.Left = new PdfPageTemplateElement(margins.Left, doc.PageSettings.Size.Height);

            doc.Template.Right = new PdfPageTemplateElement(margins.Right, doc.PageSettings.Size.Height);

            AddPagesPedido(doc, pedido, margins);

            return doc;
        }
        private static void AddPagesPedido(PdfDocument doc, Pedidos pedido, PdfMargins margins)
        {
            PdfPageBase page = doc.Pages.Add(PdfPageSize.A4, margins);
            int pageIndex = 0;
            PdfTrueTypeFont upperBodyFont = new PdfTrueTypeFont(new Font("Verdana", 9f, FontStyle.Bold));
            PdfTrueTypeFont bodyItemFont = new PdfTrueTypeFont(new Font("Verdana", 12f, FontStyle.Bold));
            PdfTrueTypeFont bodySubItemFont = new PdfTrueTypeFont(new Font("Verdana", 11f, FontStyle.Bold));
            PdfTrueTypeFont bodyContentFont = new PdfTrueTypeFont(new Font("Verdana", 10f, FontStyle.Regular));
            PdfPen pen = new PdfPen(PdfBrushes.LightGray, 1);

            PdfSolidBrush blackBrush = new PdfSolidBrush(Color.Black);
            PdfSolidBrush grayBrush = new PdfSolidBrush(Color.Gray);

            // Parte superior
            doc.Pages[pageIndex].Canvas.DrawString($"N° de pedido: {pedido.Id}", upperBodyFont, blackBrush, new PointF(0, 0));
            doc.Pages[pageIndex].Canvas.DrawString($"Fecha del pedido: {pedido.FechaAlta.Value.ToShortDateString()}", upperBodyFont, blackBrush, new PointF(0, 14));

            var datosProveedor = pedido.Proveedores;
            // Cuerpo del informe
            doc.Pages[pageIndex].Canvas.DrawString("Datos del proveedor", bodyItemFont, grayBrush, new PointF(0, 51));
            doc.Pages[pageIndex].Canvas.DrawString($"Razon social: {datosProveedor.Nombre}", bodyContentFont, blackBrush, new PointF(15, 71));
            doc.Pages[pageIndex].Canvas.DrawString($"CUIT: {datosProveedor.CUIT}", bodyContentFont, blackBrush, new PointF(15, 91));
            doc.Pages[pageIndex].Canvas.DrawString($"Direccion: {datosProveedor.Calle}", bodyContentFont, blackBrush, new PointF(15, 111));

            doc.Pages[pageIndex].Canvas.DrawString("Detalle de los productos ", bodyItemFont, grayBrush, new PointF(0, 141));
            //doc.Pages[pageIndex].Canvas.DrawString("29493929", bodySubItemFont, grayBrush, new PointF(15, 161));

            float posicionY = 180;
            foreach (PedidosDet detalle in pedido.PedidosDet)
            {
                if (posicionY >= 600) // Agregar nueva página.
                {
                    doc.Pages.Add(PdfPageSize.A4, margins);
                    pageIndex++;
                    posicionY = 20;
                }

                doc.Pages[pageIndex].Canvas.DrawString($"Producto: {detalle.Articulos.Nombre}", bodyContentFont, blackBrush, new PointF(15, posicionY));
                doc.Pages[pageIndex].Canvas.DrawString($"Cantidad: {detalle.Cantidad}", bodyContentFont, blackBrush, new PointF(15, posicionY + 20));
                doc.Pages[pageIndex].Canvas.DrawString($"Fabricante: {detalle.Articulos.Fabricantes.Nombre}", bodyContentFont, blackBrush, new PointF(15, posicionY + 40));
                doc.Pages[pageIndex].Canvas.DrawLine(pen, 10, posicionY + 80, 250, posicionY + 80);
                posicionY += 87;
            }
        }
        private static PdfPageTemplateElement CreateHeaderTemplatePedido(PdfDocument doc, PdfMargins margins, string proveedor)

        {

            //get page size

            SizeF pageSize = doc.PageSettings.Size;

            //create a PdfPageTemplateElement object as header space

            PdfPageTemplateElement headerSpace = new PdfPageTemplateElement(pageSize.Width, 70);

            headerSpace.Foreground = false;

            float x = 0;

            float y = 0;

            //draw image in header space
            var logoImg = Properties.Resources.logolcdlg;
            PdfImage headerImage = PdfImage.FromImage(logoImg);

            float width = headerImage.Width / 3;

            float height = headerImage.Height / 3;

            headerSpace.Graphics.DrawImage(headerImage, x, 0, width, height);

            //draw line in header space

            PdfPen pen = new PdfPen(PdfBrushes.Gray, 1);

            headerSpace.Graphics.DrawLine(pen, x, y + margins.Top + 5, pageSize.Width, y + margins.Top + 5);

            //draw text in header space

            PdfTrueTypeFont titleFont = new PdfTrueTypeFont(new Font("Verdana", 10f, FontStyle.Bold));
            PdfTrueTypeFont subtitleFont = new PdfTrueTypeFont(new Font("Verdana", 8f, FontStyle.Bold));


            PdfStringFormat format = new PdfStringFormat(PdfTextAlignment.Left);

            string headerText = $"Pedido a proveedor: {proveedor.TrimEnd()} - Articulos musicales";
            string subTitleText = "La casa de las guitarras (Av. Emilio Olmos 167)";

            headerSpace.Graphics.DrawString(headerText, titleFont, PdfBrushes.Gray, 100, 0, format);
            headerSpace.Graphics.DrawString(subTitleText, subtitleFont, PdfBrushes.Gray, 150, 20, format);

            return headerSpace;
        }
        #endregion

        #region "Reparacion"
        public static PdfDocument CreatePDF(Reparaciones reparacion)
        {
            PdfDocument doc = new PdfDocument();

            doc.PageSettings.Size = PdfPageSize.A4;

            //reset the default margins to 0
            doc.PageSettings.Margins = new PdfMargins(0);

            PdfMargins margins = new PdfMargins(15, 45, 15, 30);
            doc.Template.Top = CreateHeaderTemplateReparacion(doc, margins);

            //apply blank templates to other parts of page template

            doc.Template.Bottom = new PdfPageTemplateElement(doc.PageSettings.Size.Width, margins.Bottom);

            doc.Template.Left = new PdfPageTemplateElement(margins.Left, doc.PageSettings.Size.Height);

            doc.Template.Right = new PdfPageTemplateElement(margins.Right, doc.PageSettings.Size.Height);

            AddPagesReparacion(doc, reparacion, margins);

            return doc;
        }
        private static void AddPagesReparacion(PdfDocument doc, Reparaciones reparacion, PdfMargins margins)
        {
            PdfPageBase page = doc.Pages.Add(PdfPageSize.A4, margins);
            int pageIndex = 0;
            PdfTrueTypeFont upperBodyFont = new PdfTrueTypeFont(new Font("Verdana", 9f, FontStyle.Bold));
            PdfTrueTypeFont bodyItemFont = new PdfTrueTypeFont(new Font("Verdana", 12f, FontStyle.Bold));
            PdfTrueTypeFont bodySubItemFont = new PdfTrueTypeFont(new Font("Verdana", 11f, FontStyle.Bold));
            PdfTrueTypeFont bodyContentFont = new PdfTrueTypeFont(new Font("Verdana", 10f, FontStyle.Regular));
            PdfPen pen = new PdfPen(PdfBrushes.LightGray, 1);

            PdfSolidBrush blackBrush = new PdfSolidBrush(Color.Black);
            PdfSolidBrush grayBrush = new PdfSolidBrush(Color.Gray);

            // Parte superior
            doc.Pages[pageIndex].Canvas.DrawString($"N° de pedido: {reparacion.Id}", upperBodyFont, blackBrush, new PointF(0, 0));
            doc.Pages[pageIndex].Canvas.DrawString($"Fecha del pedido: {reparacion.FechaAlta.Value.ToShortDateString()}", upperBodyFont, blackBrush, new PointF(0, 14));

            // Cuerpo del informe
            doc.Pages[pageIndex].Canvas.DrawString("Datos de la Reparacion", bodyItemFont, grayBrush, new PointF(0, 51));
            doc.Pages[pageIndex].Canvas.DrawString($"Producto: {reparacion.Nombre}", bodyContentFont, blackBrush, new PointF(15, 71));
            doc.Pages[pageIndex].Canvas.DrawString($"Descripcion: {reparacion.Descripcion}", bodyContentFont, blackBrush, new PointF(15, 91));

            var dano = reparacion.EstaDanado == true ? "Si" : "No";
            var trans = reparacion.TieneTransformador == true ? "Si" : "No";
            var funda = reparacion.TieneFunda == true ? "Si" : "No";

            doc.Pages[pageIndex].Canvas.DrawString($"Esta Dañado: {dano} ", bodyContentFont, blackBrush, new PointF(15, 111));

            doc.Pages[pageIndex].Canvas.DrawString($"Tiene Transformador: {trans}", bodyContentFont, blackBrush, new PointF(15, 131));

            doc.Pages[pageIndex].Canvas.DrawString($"Tiene Funda: {funda}", bodyContentFont, blackBrush, new PointF(15, 151));

            doc.Pages[pageIndex].Canvas.DrawString($"Otras observaciones: {reparacion.Observaciones}", bodyContentFont, blackBrush, new PointF(15, 171));

            doc.Pages[pageIndex].Canvas.DrawString($"Sucursal: {reparacion.Sucursales.Nombre}", bodyContentFont, blackBrush, new PointF(15, 191));
            doc.Pages[pageIndex].Canvas.DrawString($"----------------------------------------------------", bodyContentFont, blackBrush, new PointF(200, 400));
            doc.Pages[pageIndex].Canvas.DrawString($"Firma del receptor", bodyContentFont, blackBrush, new PointF(270, 415));


        }
        private static PdfPageTemplateElement CreateHeaderTemplateReparacion(PdfDocument doc, PdfMargins margins)

        {

            //get page size

            SizeF pageSize = doc.PageSettings.Size;

            //create a PdfPageTemplateElement object as header space

            PdfPageTemplateElement headerSpace = new PdfPageTemplateElement(pageSize.Width, 70);

            headerSpace.Foreground = false;

            float x = 0;

            float y = 0;

            //draw image in header space
            var logoImg = Properties.Resources.logolcdlg;
            PdfImage headerImage = PdfImage.FromImage(logoImg);

            float width = headerImage.Width / 3;

            float height = headerImage.Height / 3;

            headerSpace.Graphics.DrawImage(headerImage, x, 0, width, height);

            //draw line in header space

            PdfPen pen = new PdfPen(PdfBrushes.Gray, 1);

            headerSpace.Graphics.DrawLine(pen, x, y + margins.Top + 5, pageSize.Width, y + margins.Top + 5);

            //draw text in header space

            PdfTrueTypeFont titleFont = new PdfTrueTypeFont(new Font("Verdana", 10f, FontStyle.Bold));
            PdfTrueTypeFont subtitleFont = new PdfTrueTypeFont(new Font("Verdana", 8f, FontStyle.Bold));


            PdfStringFormat format = new PdfStringFormat(PdfTextAlignment.Left);

            string headerText = $"La casa de las guitarras - Recibo de reparación (sin validez fiscal)";
            string subTitleText = " Av. Emilio Olmos 167 | Belgrano 78 (351 382-3500)";

            headerSpace.Graphics.DrawString(headerText, titleFont, PdfBrushes.Gray, 150, 0, format);
            headerSpace.Graphics.DrawString(subTitleText, subtitleFont, PdfBrushes.Gray, 150, 20, format);

            return headerSpace;
        }

        #endregion

        #region "Venta"
        public static PdfDocument CreatePDF(Ventas venta)
        {
            PdfDocument doc = new PdfDocument();

            doc.PageSettings.Size = PdfPageSize.A4;

            //reset the default margins to 0
            doc.PageSettings.Margins = new PdfMargins(0);

            PdfMargins margins = new PdfMargins(15, 45, 15, 30);
            doc.Template.Top = CreateHeaderTemplateVenta(doc, margins);

            //apply blank templates to other parts of page template

            doc.Template.Bottom = new PdfPageTemplateElement(doc.PageSettings.Size.Width, margins.Bottom);

            doc.Template.Left = new PdfPageTemplateElement(margins.Left, doc.PageSettings.Size.Height);

            doc.Template.Right = new PdfPageTemplateElement(margins.Right, doc.PageSettings.Size.Height);

            AddPagesVenta(doc, venta, margins);

            return doc;
        }
        private static void AddPagesVenta(PdfDocument doc, Ventas venta, PdfMargins margins)
        {
            PdfPageBase page = doc.Pages.Add(PdfPageSize.A4, margins);
            int pageIndex = 0;
            PdfTrueTypeFont upperBodyFont = new PdfTrueTypeFont(new Font("Verdana", 9f, FontStyle.Bold));
            PdfTrueTypeFont bodyItemFont = new PdfTrueTypeFont(new Font("Verdana", 12f, FontStyle.Bold));
            PdfTrueTypeFont bodySubItemFont = new PdfTrueTypeFont(new Font("Verdana", 11f, FontStyle.Bold));
            PdfTrueTypeFont bodyContentFont = new PdfTrueTypeFont(new Font("Verdana", 10f, FontStyle.Regular));
            PdfPen pen = new PdfPen(PdfBrushes.LightGray, 1);

            PdfSolidBrush blackBrush = new PdfSolidBrush(Color.Black);
            PdfSolidBrush grayBrush = new PdfSolidBrush(Color.Gray);

            // Parte superior
            doc.Pages[pageIndex].Canvas.DrawString($"N° de pedido: {venta.Id}", upperBodyFont, blackBrush, new PointF(0, 0));
            doc.Pages[pageIndex].Canvas.DrawString($"Fecha del pedido: {venta.FechaAlta.Value.ToShortDateString()}", upperBodyFont, blackBrush, new PointF(0, 14));

            string direccion = "";
            if (venta.Sucursales != null)
            {
                direccion = venta.Sucursal == 1 ? "Emilio Olmos 167" : "Belgrano 78";
            }
            // Cuerpo del informe
            doc.Pages[pageIndex].Canvas.DrawString("Datos de la venta", bodyItemFont, grayBrush, new PointF(0, 51));
            doc.Pages[pageIndex].Canvas.DrawString($"Sucursal: {venta.Sucursal}", bodyContentFont, blackBrush, new PointF(15, 91));
            doc.Pages[pageIndex].Canvas.DrawString($"Direccion: {direccion}", bodyContentFont, blackBrush, new PointF(15, 111));

            doc.Pages[pageIndex].Canvas.DrawString("Detalle de los productos ", bodyItemFont, grayBrush, new PointF(0, 141));
            //doc.Pages[pageIndex].Canvas.DrawString("29493929", bodySubItemFont, grayBrush, new PointF(15, 161));

            float posicionY = 180;
            if (venta.VentasDet.Count() > 0)
            {
                foreach (VentasDet detalle in venta.VentasDet)
                {
                    if (posicionY >= 600) // Agregar nueva página.
                    {
                        doc.Pages.Add(PdfPageSize.A4, margins);
                        pageIndex++;
                        posicionY = 20;
                    }

                    doc.Pages[pageIndex].Canvas.DrawString($"Producto: {detalle.Articulos.Nombre}", bodyContentFont, blackBrush, new PointF(15, posicionY));
                    doc.Pages[pageIndex].Canvas.DrawString($"Cantidad: {detalle.Cantidad}", bodyContentFont, blackBrush, new PointF(15, posicionY + 20));
                    doc.Pages[pageIndex].Canvas.DrawString($"Fabricante: {detalle.Articulos.Fabricantes.Nombre}", bodyContentFont, blackBrush, new PointF(15, posicionY + 40));
                    doc.Pages[pageIndex].Canvas.DrawLine(pen, 10, posicionY + 80, 250, posicionY + 80);
                    posicionY += 87;
                }
            }

        }
        private static PdfPageTemplateElement CreateHeaderTemplateVenta(PdfDocument doc, PdfMargins margins)

        {

            //get page size

            SizeF pageSize = doc.PageSettings.Size;

            //create a PdfPageTemplateElement object as header space

            PdfPageTemplateElement headerSpace = new PdfPageTemplateElement(pageSize.Width, 70);

            headerSpace.Foreground = false;

            float x = 0;

            float y = 0;

            //draw image in header space
            var logoImg = Properties.Resources.logolcdlg;
            PdfImage headerImage = PdfImage.FromImage(logoImg);

            float width = headerImage.Width / 3;

            float height = headerImage.Height / 3;

            headerSpace.Graphics.DrawImage(headerImage, x, 0, width, height);

            //draw line in header space

            PdfPen pen = new PdfPen(PdfBrushes.Gray, 1);

            headerSpace.Graphics.DrawLine(pen, x, y + margins.Top + 5, pageSize.Width, y + margins.Top + 5);

            //draw text in header space

            PdfTrueTypeFont titleFont = new PdfTrueTypeFont(new Font("Verdana", 10f, FontStyle.Bold));
            PdfTrueTypeFont subtitleFont = new PdfTrueTypeFont(new Font("Verdana", 8f, FontStyle.Bold));


            PdfStringFormat format = new PdfStringFormat(PdfTextAlignment.Left);

            string headerText = $"Informe de venta (sin validez fiscal) - Articulos musicales";
            string subTitleText = "La casa de las guitarras (Av. Emilio Olmos 167)";

            headerSpace.Graphics.DrawString(headerText, titleFont, PdfBrushes.Gray, 100, 0, format);
            headerSpace.Graphics.DrawString(subTitleText, subtitleFont, PdfBrushes.Gray, 150, 20, format);

            return headerSpace;
        }
        #endregion

    }
}
