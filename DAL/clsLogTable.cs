using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAO;
namespace DAL
{
    public class clsLogTable
    {
        dbHRSystemEntities db = new dbHRSystemEntities();

        public List<LogTable> getAll()
        {
            return db.LogTables.ToList();
        }

        public bool addLogTableEntry(LogTable model)
        {
            try
            {
                db.LogTables.Add(model);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public bool deleteLogTableEntry(Guid logTableID)
        {

            try
            {
                LogTable log = db.LogTables.Where(a => a.LogID == logTableID).FirstOrDefault();
                if (log != null)
                {
                    db.LogTables.Remove(log);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
    }
}
