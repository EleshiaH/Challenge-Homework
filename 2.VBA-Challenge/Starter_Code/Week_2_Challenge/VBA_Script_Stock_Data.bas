Attribute VB_Name = "Module1"
Sub LoopThroughWorksheets():
    Dim ws As Worksheet

' Loop through all worksheets in the active workbook
    For Each ws In ActiveWorkbook.Worksheets
    
' Do something with each worksheet

ws.Range("I1").Value = "Ticker"
ws.Range("J1").Value = "Yearly Change"
ws.Range("K1").Value = "Percent Change"
ws.Range("L1").Value = "Total Stock Volume"

ws.Range("N2").Value = "Greatest % Increase"
ws.Range("N3").Value = "Greatest % Decrease"
ws.Range("N4").Value = "Greatest Total Volume"
ws.Range("O1").Value = "Ticker"
ws.Range("P1").Value = "Value"

Dim TickerName As String
Dim YearlyChange As Double
Dim PercentChange As Double
Dim TSV As Double
Dim TSVAbsolute As Double

YearlyChange = 0
PercentChange = 0
TSV = 0
TSVAbsolute = Abs(TSV)

' Tracking the location of each stock and their values

Dim StockName As Integer
StockName = 2

'Looping through each stock listed

For i = 2 To 22771

'Check to see if the stock is the same, if it is not then...

If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then

' Set the stock name, the yearly change, percent change, and total stock volume

TickerName = ws.Cells(i, 1).Value
YearlyChange = YearlyChange + ((ws.Cells(i, 3).Value) - (ws.Cells(i, 6).Value))
PercentChange = PercentChange + ((ws.Cells(i, 3).Value) - (ws.Cells(i, 6).Value)) / (ws.Cells(i, 3).Value)
TSVAbsoulte = TSV + (((ws.Cells(i, 3).Value) - (ws.Cells(i, 6).Value)) * (ws.Cells(i, 7).Value))

'Print the stock name in the column

ws.Range("I" & StockName).Value = TickerName

'Print the Yearly change total in the column

ws.Range("J" & StockName).Value = YearlyChange

'Print the Percent change total in the column

ws.Range("K" & StockName).Value = PercentChange


'Print the total stock volume in the column

ws.Range("L" & StockName).Value = TSVAbsolute

' Adding one to the row for each stock name

StockName = StockName + 1

' Resetting each running column type

YearlyChange = 0
PercentChange = 0
TSV = 0
TSVAbsolute = Abs(TSV)

'If the cell in the next row is the same brand, then...

ElseIf ws.Cells(i + 1, 1).Value = ws.Cells(i, 1).Value Then

YearlyChange = YearlyChange + ((ws.Cells(i, 3).Value) - (ws.Cells(i, 6).Value))
PercentChange = PercentChange + ((ws.Cells(i, 3).Value) - (ws.Cells(i, 6).Value)) / (ws.Cells(i, 3).Value)
TSVAbsolute = TSV + (((ws.Cells(i, 3).Value) - (ws.Cells(i, 6).Value)) * (ws.Cells(i, 7).Value))

End If

'Add the conditionals for Yearly change to change colour depending on the value


If ws.Cells(i, 10).Value < 0 Then

ws.Cells(i, 10).Interior.ColorIndex = 3

ElseIf ws.Cells(i, 10).Value > 0 Then

ws.Cells(i, 10).Interior.ColorIndex = 4

End If

ws.Range("K" & StockName).NumberFormat = "0.00%"
ws.Range("L" & StockName).NumberFormat = "$0"

Next i

Next ws

End Sub

Sub LoopThroughWorksheets2():
    Dim ws As Worksheet

' Loop through all worksheets in the active workbook
    For Each ws In ActiveWorkbook.Worksheets
    
    Dim LastRow As Long
    
    Dim MaxPChange As Double
    Dim MaxStock As String
    
    Dim MinPChange As Double
    Dim MinStock As String
    
    Dim MaxGTV As Double
    Dim GTVStock As String

    Dim e As Long
    
    
    ' Get the last row with data in column I
    
    LastRow = ActiveSheet.Cells(Rows.Count, 9).End(xlUp).Row
    
    ' Make the maximum value to the first value in column K
    
    MaxPChange = ws.Cells(2, 11).Value
    MinPChange = ws.Cells(2, 11).Value
    MaxGTV = ws.Cells(2, 12).Value
    GTVStock = ws.Cells(2, 9).Value
    
    ' Make the maximum name to the first value in column I
    
    MaxStock = ws.Cells(2, 9).Value
    MinStock = ws.Cells(2, 9).Value
    
    ' Loop through the rows from row 2 to the last row
    For e = 2 To LastRow
    
    ' If the value in column K is greater than the current maximum value
        If ws.Cells(e, 11).Value > MaxPChange Then
        
        ' Update the maximum value
            MaxPChange = ws.Cells(e, 11).Value
            
            ' Update the corresponding stock name
            MaxStock = ws.Cells(e, 9).Value
            
       ElseIf Cells(e, 11).Value < MinPChange Then
     ' Update the minumum value
            MinPChange = ws.Cells(e, 11).Value
            
            ' Update the corresponding stock name
            MinStock = ws.Cells(e, 9).Value

 ' If the value in column K is greater than the current maximum value
        ElseIf ws.Cells(e, 12).Value > MaxGTV Then
        
        ' Update the maximum value
            MaxGTV = ws.Cells(e, 12).Value
            
            ' Update the corresponding stock name
            GTVStock = ws.Cells(e, 9).Value
            
        End If
    Next e
    
  ' Print the results in the summary table
    ws.Range("O2").Value = MaxStock
    ws.Range("P2").Value = MaxPChange
    ws.Range("P2").NumberFormat = "0.00%"
    
    ws.Range("O3").Value = MinStock
    ws.Range("P3").Value = MinPChange
    ws.Range("P3").NumberFormat = "0.00%"
    
    ws.Range("O4").Value = GTVStock
    ws.Range("P4").Value = MaxGTV
    ws.Range("P4").NumberFormat = "$0"

Next ws
    
End Sub




