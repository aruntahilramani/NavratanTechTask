using NavratanTechTask.ModelDTO;
using NavratanTechTask.Models;
using System.Security.Claims;

namespace NavratanTechTask.Services.OrdersService
{
    public class OrdersService : IOrdersService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public OrdersService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public Response AddOrders(List<OrdersDTO> orders, DatabaseContext _context)
        {
             
            Response response = new Response();
            try
            {   
                Guid UserId = Guid.Parse(_httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier));
                foreach (var order in orders)
                {
                    Orders addOrder = new Orders();
                    addOrder.OrderID = Guid.NewGuid();
                    addOrder.ItemName = order.ItemName;
                    addOrder.Qty = order.Qty;
                    addOrder.UserID = UserId;
                    addOrder.OrderedOn = DateTime.Now;
                    _context.Orders.Add(addOrder);
                }
                var check = _context.SaveChanges();
                if (check > 0)
                {
                    response.Message = "Ordered Successfully";
                    response.IsError = 'N';
                    return response;
                }
                else
                {
                    response.Message = "Order Failed";
                    response.IsError = 'Y';
                    return response;
                }
                
            }
            catch (Exception ex)
            {
                #pragma warning disable CS8602 // Dereference of a possibly null reference.
                    Log(_context, "NavratanTech.OrdersService.AddOrders", ex.Message,Guid.Parse(_httpContextAccessor.HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier)), ex);
                #pragma warning restore CS8602 // Dereference of a possibly null reference.
                response.IsError = 'Y';
                response.Message = "Something went wrong. Please Contact Administrator : " + ex.Message;
                return response;
            }
        }

        public List<Orders> GetOrdersByUserId(Guid userId, int pageSize, int skip, DatabaseContext _context)
        {
           var orders = _context.Orders.Where(x=>x.UserID == userId).OrderBy(x=>x.OrderedOn).Skip(skip).Take(pageSize).ToList();
           return orders;
        }

        public void Log(DatabaseContext _context, string originator, string message, Guid UserId, Exception ex = null)
        {
            try
            {

                ApplicationLog logEntry = new ApplicationLog()
                {
                    ApplicationLogID = Guid.NewGuid(),
                    Exception = (ex != null) ? ex.ToString() : "",
                    LogDate = DateTime.Now,
                    LogOriginator = originator,
                    Message = message,
                    UserID = UserId
                };

                _context.ApplicationLog.Add(logEntry);
                _context.SaveChanges();
            }
            catch
            {
                //Log to some other location
            }
        }
    }
}
