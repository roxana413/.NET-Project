using Domain.Common;

namespace Domain.Entities
{
    public class House : BaseEntity
    {
        public DateTime DateSold { get; set; }
        public double Price { get; set; }
        public int Bedrooms { get; set; }
        public decimal Bathrooms { get; set; }
        public decimal LivingArea { get; set; }
        public decimal LotArea { get; set; }
        public decimal Floors { get; set; }
        public bool Waterfront { get; set; }
        public int View { get; set; }
        public int Condition { get; set; }
        public int Grade { get; set; }
        public decimal AboveArea { get; set; }
        public decimal BasementArea { get; set; }
        public int YearBuilt { get; set; }
        public int YearRenovated { get; set; }
        public string? Zipcode { get; set; }

    }
}
