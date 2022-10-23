using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeGradeTracking.BILL
{
    public interface IDesignationRepo
    {
        ICollection<DesignationDTO> GetAll();
        DesignationDTO Get(int id);
        void Insert(DesignationDTO dto);
        void Update(DesignationDTO dto);
        void Delete(DesignationDTO dto);
        int DesignationCount();
    }
}
