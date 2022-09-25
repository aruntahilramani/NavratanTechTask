using System.ComponentModel.DataAnnotations;

namespace NavratanTechTask.ModelDTO
{
    public class OrdersDTO
    {
        [Required]
        public string ItemName { get; set; }
        [Required]
        public int Qty { get; set; }
    }
}
