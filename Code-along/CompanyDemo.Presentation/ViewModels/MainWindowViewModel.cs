using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CompanyDemo.Domain;
using CompanyDemo.Infrastructure.Data.Model;

namespace CompanyDemo.Presentation.ViewModels
{
    internal class MainWindowViewModel : ViewModelBase
    {
        public ObservableCollection<string> Regions { get; private set; }

        private string? _selectedRegion;

        public string? SelectedRegion
        {
            get => _selectedRegion;
            set 
            { 
                _selectedRegion = value;

                LoadOrders();

                RaisePropertyChanged();
                RaisePropertyChanged("Orders");
            }
        }
        public ObservableCollection<Order> Orders { get; private set; }

        public MainWindowViewModel()
        {
            LoadRegions();
        }

        private void LoadRegions()
        {
            using var db = new CompanyContext();

            Regions = new ObservableCollection<string>(
                db.Orders.Select(o => o.ShipRegion).Distinct().ToList()
            );

            SelectedRegion = Regions.FirstOrDefault();
        }

        private void LoadOrders()
        {
            using var db = new CompanyContext();

            Orders = new ObservableCollection<Order>(
                db.Orders.Where(o => o.ShipRegion == SelectedRegion).ToList()
            );
        }
    }
}
