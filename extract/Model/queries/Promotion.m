let
    Source = #"Contoso Folder",
    #"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Promotion csv" = Source{[#"Folder Path"="E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\",Name="Promotion.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Promotion csv",[Delimiter="|", Columns=8, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"PromotionKey", Int64.Type}, {"Promotion Code", Int64.Type}, {"Promotion", type text}, {"Discount", type number}, {"Promotion Type", type text}, {"Promotion Category", type text}, {"Start Date", type datetime}, {"End Date", type datetime}})
in
    #"Changed Type"