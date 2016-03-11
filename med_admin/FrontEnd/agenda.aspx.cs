using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DHTMLX.Scheduler;

namespace FrontEnd
{
    public partial class agenda : System.Web.UI.Page
    {
        public DHXScheduler Scheduler { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            // instancia o SCHEDULER
            this.Scheduler = new DHXScheduler();

            //Scheduler.InitialDate = DateTime.Now;
            //Scheduler.Config.first_hour = 8;
            //Scheduler.Config.last_hour = 19;
            //Scheduler.Config.time_step = 30;
            //Scheduler.Config.limit_time_select = true;

            Scheduler.DataAction = "Data.ashx";
            Scheduler.SaveAction = "Save.ashx";
            Scheduler.LoadData = true;
            Scheduler.EnableDataprocessor = true;
        }
    }
}