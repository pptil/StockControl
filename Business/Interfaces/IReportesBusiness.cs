using Model.Enums;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Interfaces
{
    public interface IReportesBusiness
    {
        Task<MemoryStream> GenerarInformePDF(int casoFraudeId, TipoPDFEnum tipo);
    }
}
