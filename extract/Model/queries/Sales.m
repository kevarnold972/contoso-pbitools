let
    Source = #"Contoso Folder",
    #"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Sales csv" = Source{[#"Folder Path"="E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\",Name="Sales.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Sales csv",[Delimiter="|", Columns=15, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"StoreKey", Int64.Type}, {"ProductKey", Int64.Type}, {"PromotionKey", Int64.Type}, {"CurrencyKey", Int64.Type}, {"CustomerKey", Int64.Type}, {"OrderDateKey", Int64.Type}, {"Order Date", type datetime}, {"Delivery Date", type datetime}, {"Order Number", Int64.Type}, {"Order Line Number", Int64.Type}, {"Quantity", Int64.Type}, {"Unit Price", type number}, {"Unit Discount", Int64.Type}, {"Unit Cost", type number}, {"Net Price", type number}})
in
    #"Changed Type"