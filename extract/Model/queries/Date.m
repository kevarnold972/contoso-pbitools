let
    Source = #"Contoso Folder",
    #"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Date csv" = Source{[#"Folder Path"="E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\",Name="Date.csv"]}[Content],
    #"Imported CSV" = Csv.Document(#"E:\OneDrive\Documents\_Me\PBI Learning\Data Extracts\Contoso\_Date csv",[Delimiter="|", Columns=26, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Promoted Headers" = Table.PromoteHeaders(#"Imported CSV", [PromoteAllScalars=true]),
    #"Changed Type" = Table.TransformColumnTypes(#"Promoted Headers",{{"Date", type datetime}, {"DateKey", Int64.Type}, {"Calendar Year Number", Int64.Type}, {"Calendar Year", type text}, {"Calendar Year Quarter Number", Int64.Type}, {"Calendar Year Quarter", type text}, {"Calendar Year Month Number", Int64.Type}, {"Calendar Year Month", type date}, {"Month Number", Int64.Type}, {"Month", type text}, {"Day of Week Number", Int64.Type}, {"Day of Week", type text}, {"Fiscal Year Number", Int64.Type}, {"Fiscal Year", type text}, {"Fiscal Quarter Number", Int64.Type}, {"Fiscal Quarter", type text}, {"Fiscal Year Quarter Number", Int64.Type}, {"Fiscal Year Quarter", type text}, {"Fiscal Month Number", Int64.Type}, {"Fiscal Month", type text}, {"Working Day", type text}, {"Is Holiday", Int64.Type}, {"Holiday Name", type text}, {"Europe Season", type text}, {"North America Season", type text}, {"Asia Season", type text}})
in
    #"Changed Type"