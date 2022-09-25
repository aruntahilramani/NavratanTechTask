using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NavratanTechTask.Models
{
    public class Orders
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public Guid OrderID { get; set; }
        public string ItemName { get; set; } = string.Empty;
        public int Qty { get; set; }
        public Guid UserID { get; set; }
        public DateTime OrderedOn { get; set; }
    }
}
