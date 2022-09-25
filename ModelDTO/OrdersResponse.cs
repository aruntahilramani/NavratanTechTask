using NavratanTechTask.Models;

namespace NavratanTechTask.ModelDTO
{
    public class OrdersResponse : Response
    {
        public List<Orders> Orders { get; set; }
    }
}
