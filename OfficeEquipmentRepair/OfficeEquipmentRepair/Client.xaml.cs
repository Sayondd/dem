using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
    /// Логика взаимодействия для Client.xaml
    /// </summary>
    public partial class Client : Window
    {
        int id;
        public Client(int user)
        {
            InitializeComponent();
            id = user;
            DGV.ItemsSource = App.entities.DataRequests.Where(c => c.clientID == id).ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            AddRequest add = new AddRequest(id);
            add.ShowDialog();
            DGV.ItemsSource = App.entities.DataRequests.Where(c => c.clientID == id).ToList();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            var ER = DGV.SelectedItem as DataBase.DataRequest;
            if (ER != null)
            {
                editRequest edit = new editRequest(id, ER);
                edit.ShowDialog();
                DGV.ItemsSource = App.entities.DataRequests.Where(c => c.clientID == id).ToList();
            }
            else
            {
                
            }
        }
    }
}
