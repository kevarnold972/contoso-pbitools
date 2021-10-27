let
    Source = #"Contoso Folder",
    #"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Customer csv" = Source{[#"Folder Path"="E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\",Name="Customer.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Customer csv",[Delimiter="|", Columns=24, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"CustomerKey", Int64.Type}, {"Customer Code", type text}, {"Title", type text}, {"Name", type text}, {"Birth Date", type datetime}, {"Marital Status", type text}, {"Gender", type text}, {"Yearly Income", Int64.Type}, {"Total Children", Int64.Type}, {"Children At Home", Int64.Type}, {"Education", type text}, {"Occupation", type text}, {"House Ownership", type text}, {"Cars Owned", Int64.Type}, {"Continent", type text}, {"City", type text}, {"State", type text}, {"Address Line 1", type text}, {"Address Line 2", type text}, {"Phone", type text}, {"Date First Purchase", type datetime}, {"Customer Type", type text}, {"Company Name", type text}, {"CountryRegion", type text}})
in
    #"Changed Type"