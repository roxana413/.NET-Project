using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.DataImporter
{
    public static class HouseDataImporter
    {
        public static IList<House> ReadRecords(string filename, bool hasHeader = true)
        {
            var records = new List<House>();
            var bulkContent = File.ReadAllText(filename);
            var bulkLines = bulkContent.Split("\n")
                .ToList();

            if (hasHeader)
            {
                bulkLines.RemoveAt(0);
            }

            foreach (var line in bulkLines)
            {
                var mappedRecord = MapLineToRecord(line);
                if (mappedRecord != null)
                {
                    records.Add(mappedRecord);
                }
            }

            return records;
        }

        private static House MapLineToRecord(string line)
        {
            char[] delimiterChars = { '"', ',' };
            var properties = line.Split(delimiterChars, StringSplitOptions.RemoveEmptyEntries);

            for (int i = 0; i < properties.Length; i++)
            {
                if (properties[i].Equals("null"))
                {
                    properties[i] = null;
                }
            }

            if (properties.Length == 0)
            {
                return null;
            }

            string dateSold = properties[HousesDataDefaultMapper.DateSold_Index];
            string year = "";
            string month = "";
            string day = "";
            for (int i = 0; i < 4; i++)
            {
                year += (properties[HousesDataDefaultMapper.DateSold_Index].ElementAt(i));

            }

            for (int i = 0; i < 2; i++)
            {
                month += (properties[HousesDataDefaultMapper.DateSold_Index].ElementAt(i + 4));
                day += (properties[HousesDataDefaultMapper.DateSold_Index].ElementAt(i + 6));
            }
            month += "/";
            day += "/";
            string date = month + day + year;

            string price = properties[HousesDataDefaultMapper.Price_Index];
            double house_price = 0;
            if (price.Contains('e'))
            {
                int pow = price.LastOrDefault() - 48;
                house_price = double.Parse(GetUntilOrEmpty(price, "e"));
                double multiplier = Math.Pow(10, pow);
                house_price = house_price * multiplier;
            }
            else
            {
                house_price = double.Parse(properties[HousesDataDefaultMapper.Price_Index]);
            }

            bool waterfront = false;
            if (properties[HousesDataDefaultMapper.Waterfront_Index] == "0")
                waterfront = false;
            else
                waterfront = true;

            var record = new House
            {

                DateSold = DateTime.ParseExact(date, "MM/dd/yyyy", null),
                Price = house_price,
                Bedrooms = int.Parse(properties[HousesDataDefaultMapper.Bedrooms_Index]),
                Bathrooms = decimal.Parse(properties[HousesDataDefaultMapper.Bathrooms_Index]),
                LivingArea = decimal.Parse(properties[HousesDataDefaultMapper.LivingArea_Index]),
                LotArea = decimal.Parse(properties[HousesDataDefaultMapper.LotArea_Index]),
                Floors = decimal.Parse(properties[HousesDataDefaultMapper.Floors_Index]),
                Waterfront = waterfront,
                View = int.Parse(properties[HousesDataDefaultMapper.View_Index]),
                Condition = int.Parse(properties[HousesDataDefaultMapper.Condition_Index]),
                Grade = int.Parse(properties[HousesDataDefaultMapper.Grade_Index]),
                AboveArea = decimal.Parse(properties[HousesDataDefaultMapper.AboveArea_Index]),
                BasementArea = decimal.Parse(properties[HousesDataDefaultMapper.BasementArea_Index]),
                YearBuilt = int.Parse(properties[HousesDataDefaultMapper.YearBuild_Index]),
                YearRenovated = int.Parse(properties[HousesDataDefaultMapper.YearRenovated_Index]),
                Zipcode = (properties[HousesDataDefaultMapper.Zipcode_Index]),

            };
            return record;
        }

        private static ReadOnlySpan<char> GetUntilOrEmpty(string text, string stopAt)
        {

            if (!string.IsNullOrWhiteSpace(text))
            {
                int charLocation = text.IndexOf(stopAt, StringComparison.Ordinal);

                if (charLocation > 0)
                {
                    return text.Substring(0, charLocation);
                }
            }

            return string.Empty;
        }
    }
}
