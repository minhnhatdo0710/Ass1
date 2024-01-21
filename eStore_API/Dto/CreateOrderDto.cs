namespace eStore_API;

public class CreateOrderDto
{
    public CreateOrderDto()
    {
        ProductIds = new List<int>();
    }
    public int OrderId { get; set; }
    public int MemberId { get; set; }
    public DateTime OrderDate { get; set; }
    public DateTime? RequiredDate { get; set; }
    public DateTime ShippedDate { get; set; }
    public int? Freight { get; set; }
    public List<int> ProductIds { get; set; }

}
