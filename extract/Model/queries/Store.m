let
    Source = #"Contoso Folder",
    #"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Store csv" = Source{[#"Folder Path"="E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\",Name="Store.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Store csv",[Delimiter="|", Columns=19, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"StoreKey", Int64.Type}, {"Store Type", type text}, {"Store Name", type text}, {"Status", type text}, {"Open Date", type datetime}, {"Close Date", type datetime}, {"Zip Code", Int64.Type}, {"Zip Code Extension", Int64.Type}, {"Store Phone", type text}, {"Continent", type text}, {"City", type text}, {"State", type text}, {"Address Line 1", type text}, {"Address Line 2", type text}, {"Close Reason", type text}, {"Employees", Int64.Type}, {"Selling Area", Int64.Type}, {"Last Remodel Date", type datetime}, {"CountryRegion", type text}})
in
    #"Changed Type"