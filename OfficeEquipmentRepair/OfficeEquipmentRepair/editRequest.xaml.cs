using OfficeEquipmentRepair.DataBase;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace OfficeEquipmentRepair
{
    /// <summary>
    /// Логика взаимодействия для editRequest.xaml
    /// </summary>
    public partial class editRequest : Window
    {
        int id;
        DataBase.DataRequest user;
        public editRequest(int edit, DataBase.DataRequest data)
        {
            InitializeComponent();
            id = edit;
            this.DataContext = data;
            user = data;

            type.ItemsSource = App.entities.OrgTechTypes.Select(c => c.name).ToList();
            problem.ItemsSource = App.entities.ProblemDescryptions.Select(c => c.name).ToList();

            List <OrgTechType> orgs = App.entities.OrgTechTypes.Where(c => c.id == user.id_orgTechType).ToList();
            type.Text = orgs[0].name.ToString();

            List <ProblemDescryption> problems = App.entities.ProblemDescryptions.Where(c => c.id ==user.id_problemDescryption).ToList();
            problem.Text = problems[0].name.ToString();

            List<DataRequest> datas = App.entities.DataRequests.Where(c => c.requestID == user.requestID).ToList();
            model.Text = datas[0].orgTechModel.ToString();
        }


        /// <summary>
        /// бждорлгпргпргпр
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

            List <DataRequest> datas = App.entities.DataRequests.Where(c => c.requestID == user.requestID).ToList();

            var idtype = App.entities.OrgTechTypes.Where(c => c.name == type.Text).Select(c => c.id).FirstOrDefault();
            var idproblem = App.entities.ProblemDescryptions.Where(c => c.name == problem.Text).Select(c => c.id).FirstOrDefault();

            datas[0].id_orgTechType = idtype;
            datas[0].id_problemDescryption = idproblem;
            datas[0].orgTechModel = model.Text;

            App.entities.DataRequests.AddOrUpdate();
            App.entities.SaveChanges();

            MessageBox.Show("Данные изменены");
            Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
