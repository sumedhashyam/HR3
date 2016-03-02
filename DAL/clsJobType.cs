using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAO;

namespace DAL
{
    public class clsJobType
    {
        dbHRSystemEntities db = new dbHRSystemEntities();
        public List<JobType> getJobType()
        {
            try
            {
                return db.JobTypes.ToList();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }

        public bool addJobType(JobType obj)
        {
            try
            {
                db.JobTypes.Add(obj);
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }

        public JobType getJobTypebyId(Guid id)
        {
            try
            {
                return db.JobTypes.Where(a => a.JobTypeID == id).FirstOrDefault();
            }
            catch (Exception ee)
            {
                throw ee;
            }
        }
        public bool updateJobTypeDetail(JobType objEdit)
        {
            try
            {
                JobType JobTypeObj = db.JobTypes.Where(a => a.JobTypeID == objEdit.JobTypeID).FirstOrDefault();
                JobTypeObj.JobTypeName = objEdit.JobTypeName;
                JobTypeObj.JobTypeNameAr = objEdit.JobTypeNameAr;
                JobTypeObj.JobCode = objEdit.JobCode;
                JobTypeObj.IsActive = objEdit.IsActive;
                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {
                return false;
            }

        }
        public bool deleteJobType(Guid id)
        {


            try
            {
                JobType deleteDetail = db.JobTypes.Where(a => a.JobTypeID == id).FirstOrDefault();

                db.JobTypes.Remove(deleteDetail);

                db.SaveChanges();
                return true;
            }
            catch (Exception ee)
            {

                return false;
            }

        }
    }
}
