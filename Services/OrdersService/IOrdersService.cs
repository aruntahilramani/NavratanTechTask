using NavratanTechTask.ModelDTO;
using NavratanTechTask.Models;

namespace NavratanTechTask.Services.OrdersService
{
    public interface IOrdersService
    {
        List<Orders> GetOrdersByUserId(Guid userId, int pageSize, int skip, DatabaseContext _context);
        Response AddOrders(List<OrdersDTO> orders, DatabaseContext _context);
        void Log(DatabaseContext _context, string originator, string message, Guid UserId, Exception ex = null);


    }
}
