using System;
using System.Collections.Generic;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace OfficeEquipmentRepair
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        int id;
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = App.entities.DataUsers.FirstOrDefault(c => c.login == login.Text && c.password == password.Text);
                if (user != null)
                {
                    id = user.userID;
                    switch (user.id_type)
                    {
                        case 1:
                            Client client = new Client(id);
                            client.Show();
                            Close();
                            break;
                        case 2:
                            Master master = new Master();
                            master.Show();
                            Close();
                            break;
                        case 3:
                            MessageBox.Show("Данного пользователя нет в системе", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                            break;
                        case 4:
                            Operator perator = new Operator();
                            perator.Show();
                            Close();
                            break;
                    }

                }
                else
                {
                    MessageBox.Show("Данного пользователя нет в системе", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch
            {
                MessageBox.Show("Ошибка", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
