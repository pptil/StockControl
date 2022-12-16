using Business.Helpers;
using Business.Interfaces;
using DataAccess.Interfaces;
using Model.Enums;
using Modelo.Models;
using Spire.Pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Business
{
    public class ReportesBusiness : IReportesBusiness
    {
        private readonly IPedidosDao _pedidosDao;
        private readonly IVentasDao _ventasDao;
        private readonly IReparacionesDao _reparacionesDao;
        public ReportesBusiness(IPedidosDao pedidosDao, IVentasDao ventasDao, IReparacionesDao reparacionesDao)
        {
            _pedidosDao = pedidosDao;
            _ventasDao = ventasDao;
            _reparacionesDao = reparacionesDao;
        }
        public async Task<MemoryStream> GenerarInformePDF(int pedidoId, TipoPDFEnum tipo)
        {
            PdfDocument pdfDocument = new PdfDocument();
            switch (tipo)
            {
                case TipoPDFEnum.Pedido:
                    Pedidos pedido = _pedidosDao.GetPedido(pedidoId);
                    pdfDocument = PDFHelper.CreatePDF(pedido);
                    break;
                case TipoPDFEnum.Venta:
                    Ventas venta = _ventasDao.GetVenta(pedidoId);
                    pdfDocument = PDFHelper.CreatePDF(venta);
                    break;
                case TipoPDFEnum.Reparacion:
                    Reparaciones reparacion = await _reparacionesDao.GetReparacionParaInforme(pedidoId);
                    pdfDocument = PDFHelper.CreatePDF(reparacion);
                    break;
                default:
                    break;
            }
            
            // guardar en un memory stream para descargar en el navegador
            MemoryStream outStream = new MemoryStream();
            outStream.Position = 0;
            pdfDocument.SaveToStream(outStream, Spire.Pdf.FileFormat.PDF);
            return outStream;
        }

    }
}
