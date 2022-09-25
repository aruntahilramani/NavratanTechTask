using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NavratanTechTask.ModelDTO;
using NavratanTechTask.Models;
using NavratanTechTask.Services.OrdersService;
using System.Security.Claims;

namespace NavratanTechTask.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class OrdersController : ControllerBase
    {
        private readonly DatabaseContext _context;
        private readonly IOrdersService _orderService;

        public OrdersController(DatabaseContext context, IOrdersService orderService)
        {
            _context = context;
            _orderService = orderService;
        }

        [HttpPost("AddOrders"), Authorize]
        public async Task<ActionResult<Response>> AddOrders(List<OrdersDTO> orders)
        {
            Response response = new Response();
            try
            {
                response = _orderService.AddOrders(orders,_context);
                return Ok(response);
            }
            catch (Exception ex)
            {
                _orderService.Log(_context, "NavratanTech.OrdersController.RefreshToken", ex.Message, Guid.Empty, ex);
                response.IsError = 'Y';
                response.Message = ex.Message;
                return Ok(response);
            }
        }

        [HttpGet("GetOrdersofLoggedInUser"), Authorize]
        public async Task<ActionResult<List<OrdersResponse>>> GetOrdersofLoggedInUser(int pageSize, int Skip)
        {
            OrdersResponse ordersResponse = new OrdersResponse();
            Guid UserId = Guid.Parse(HttpContext.User.FindFirstValue(ClaimTypes.NameIdentifier));
            try
            {
                var list = _orderService.GetOrdersByUserId(UserId, pageSize, Skip, _context);
                ordersResponse.Orders = list;
                ordersResponse.IsError = 'N';
                ordersResponse.Message = "Success";
                return Ok(ordersResponse);
            }
            catch (Exception ex)
            {
                _orderService.Log(_context, "NavratanTech.OrdersController.RefreshToken", ex.Message, UserId, ex);
                ordersResponse.IsError = 'Y';
                ordersResponse.Message = ex.Message;
                return Ok(ordersResponse);
            }
        }

    }
}
