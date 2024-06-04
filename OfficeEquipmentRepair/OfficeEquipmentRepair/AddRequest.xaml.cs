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
    /// Логика взаимодействия для AddRequest.xaml
    /// </summary>
    public partial class AddRequest : Window
    {
        int id;
        public AddRequest(int client)
        {
            InitializeComponent();
            id = client;
            type.ItemsSource = App.entities.OrgTechTypes.Select(c => c.name).ToList();
            problem.ItemsSource = App.entities.ProblemDescryptions.Select(c => c.name).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            var typ = App.entities.OrgTechTypes.Where(c => c.name == type.Text).Select(a => a.id).FirstOrDefault();
            var prob = App.entities.ProblemDescryptions.Where(c => c.name == problem.Text).Select(a => a.id).FirstOrDefault();

            DataRequest data = new DataRequest()
            {
                startDate = DateTime.Now,
                id_orgTechType = typ,
                id_problemDescryption = prob,
                orgTechModel = model.Text,
                clientID = id,
                id_requestStatus = 3
            };
            App.entities.DataRequests.Add(data);
            App.entities.SaveChanges();
            MessageBox.Show("Данные добавлены");
            Close();
        }
    }
}
