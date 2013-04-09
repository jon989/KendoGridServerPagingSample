using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KendoGridExample
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static ItemGridModel GetItemsBlank()
        {
            return GetData();
        }

        [WebMethod]
        public static ItemGridModel GetItems(int skip, int take, int page, int pageSize)
        {
            return GetData();
        }

        public static ItemGridModel GetData()
        {
            List<ItemGridItem> items = new List<ItemGridItem>();
            items.Add(new ItemGridItem() { ID= Guid.NewGuid().ToString(), FirstName="Kori", LastName="Francis" });
            items.Add(new ItemGridItem() { ID = Guid.NewGuid().ToString(), FirstName = "Guy", LastName = "Smith" });
            items.Add(new ItemGridItem() { ID = Guid.NewGuid().ToString(), FirstName = "Scott", LastName = "Pilgrim" });
            return new ItemGridModel(items, items.Count);
        }
    }
  
    public class ItemGridModel
    {
        public List<ItemGridItem> Items { get; private set; }
        public int TotalItemCount { get; private set; }

        public ItemGridModel(List<ItemGridItem> Items, int TotalItemCount)
        {
            this.Items = Items;
            this.TotalItemCount = TotalItemCount;
        }
    }

    public class ItemGridItem
    {
        public string ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}