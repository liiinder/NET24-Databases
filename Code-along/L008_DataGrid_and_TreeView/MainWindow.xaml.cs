using L008_DataGrid_and_TreeView.Model;
using Microsoft.EntityFrameworkCore;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace L008_DataGrid_and_TreeView
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Loaded += MainWindow_Loaded;
        }

        private void MainWindow_Loaded(object sender, RoutedEventArgs e)
        {
            SetTreeViewSource();
        }

        private void SetTreeViewSource()
        {
            using var db = new EveryloopContext();

            var artists = db.Artists.Include(artist => artist.Albums).ThenInclude(album => album.Tracks).ToList();

            myTreeView.ItemsSource = artists;
        }

        private void SetDataGridSource(Album album)
        {
            using var db = new EveryloopContext();

            var tracks = db.Tracks.Where(t => t.Album == album).ToList();

            myDataGrid.ItemsSource = tracks;
        }

        private void myTreeView_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            if (e.NewValue is Album album)
            {
                SetDataGridSource(album);
            }
        }
    }
}