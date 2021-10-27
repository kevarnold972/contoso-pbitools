let
    Source = #"Contoso Folder",
    #"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Product csv" = Source{[#"Folder Path"="E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\",Name="Product.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Product csv",[Delimiter="|", Columns=13, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"ProductKey", Int64.Type}, {"Product Code", Int64.Type}, {"Product Name", type text}, {"Manufacturer", type text}, {"Brand", type text}, {"Color", type text}, {"Weight", type text}, {"Weight Unit Measure", type text}, {"Unit Cost", type number}, {"Unit Price", type number}, {"Available Date", type datetime}, {"Subcategory", type text}, {"Category", type text}})
in
    #"Changed Type"